module enum_enhancers;

pure nothrow string generateEnumAliases(theEnum)()  if (is(theEnum == enum))
{
    string result = "";
    foreach( member; __traits(allMembers, theEnum) )
        result ~= "alias "~theEnum.stringof~"."~member~" "~member~";\n";
    return result;
}

/+ TODO: name this something like "expandEnumAliases" +/
mixin template dequalifyEnum(theEnum) if (is(theEnum == enum))
{
    mixin(generateEnumAliases!theEnum());
}

pure nothrow string generateEnumToString(theEnum)() if (is(theEnum == enum))
{
    string result =
        "string toString("~theEnum.stringof~" val)\n"~
        "{\n"~
        "    final switch(val)\n"~
        "    {\n";

    foreach( member; __traits(allMembers, theEnum) )
    {
        result ~=
        "        case "~theEnum.stringof~"."~member~": return \""~theEnum.stringof~"."~member~"\";\n";
    }

    result ~=
        "    }\n"~
        "    assert(0);\n"~
        "}\n";
    return result;
}

mixin template toStringifyEnum(theEnum) if (is(theEnum == enum))
{
    mixin(generateEnumToString!theEnum());
}

pure nothrow string generateFlagsToString(theEnum)() if (is(theEnum == enum))
{
    string result =
`import std.exception : assumeUnique;
string toString(`~theEnum.stringof~` val)
{
    char[] result = "`~theEnum.stringof~`{".dup;
`;

    foreach( member; __traits(allMembers, theEnum) )
    {
        result ~=
`    if ( val & `~theEnum.stringof~`.`~member~` )
        result ~= "`~member~`|";
`;
    }

    result ~=
`
    if ( result[$-1] == '|' )
        result[$-1] = '}';
    else
        result ~= "}";

    return assumeUnique(result);
}
`;

    return result;
}

mixin template toStringifyFlags(theEnum) if (is(theEnum == enum))
{
    mixin(generateFlagsToString!theEnum());
}