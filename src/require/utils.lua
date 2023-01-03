function StrSplit(str, splitter)
    local i1,i2 = string.find(str, splitter)
    if not i1
    then
        return str, ""
    end

    local str1, str2 = {}, {}

    for i=1, i1-1
    do
        table.insert(str1, string.char(string.byte(str, i)))
    end

    for i=i2+1, #str
    do
        table.insert(str2, string.char(string.byte(str, i)))
    end

    return table.concat(str1), table.concat(str2)
end

function IsInRange(number, lower_limit, upper_limit)
    if number >= lower_limit and number <= upper_limit
    then
        return true
    end
    return false
end

function IsNumericString(str)
    if string.match(str, "%d") and not string.match(str, "%D")
    then
        return true
    end
    return false
end