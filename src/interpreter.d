/+
module interpreter;

import std.string;

struct ParseResult
{
    string originalText;
    int begin = -1, end = -1;

    @property success() const { return begin >= 0; }
}

ParseResult parseSuccess(string originalText, int begin, int end)
{
    ParseResult result;
    result.originalText = originalText;
    result.begin = begin;
    result.end = end;
    return result;
}

ParseResult parseFail(string originalText)
{
    ParseResult result;
    result.originalText = originalText;
    result.begin = -1;
    return result;
}

private bool isWhite(char c)
{
    if ( c == ' ' || c == '\t' || c == '\r' || c == '\n' )
        return true;
    else
        return false;
}

ParseResult mandatoryWhitespace(string corpus, int pos)
{
    if ( pos >= corpus.length || !isWhite(corpus[pos]) )
        return parseFail(corpus);

    int newPos = pos+1;
    while ( newPos < corpus.length && isWhite(corpus[newPos]) )
        newPos++;

    return parseSuccess(corpus, pos, newPos);
}

ParseResult parseKeyword(string keyword)(string corpus, int pos)
{
    int newPos = pos;
    if ( corpus[pos..$].length < keyword.length )
        return parseFail(corpus);

    newPos = pos+keyword.length;
    if ( icmp(keyword,corpus[pos .. newPos]) == 0 )
    {
        auto r = mandatoryWhitespace(corpus,newPos);
        if ( r.success )
            newPos = r.end;
        return parseSuccess(corpus, pos, newPos);
    }

    return parseFail(corpus);
}

void interpret(string command)
{
    int pos = 0;

    auto r = parseKeyword!"show"(command,pos);
    if ( r.success )

}
+/