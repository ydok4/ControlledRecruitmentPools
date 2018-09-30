

function ConcatTableWithKeys(destinationTable, sourceTable)
    for key, value in pairs(sourceTable) do
        destinationTable[key] = value;
    end
end

function TableHasAnyValue(table)
    for key, value in pairs(table) do
        return true;
    end
    return false;
end

function Random(limit)
    return math.random(limit) ;
end

function GetRandomObjectFromList(objectList)
    local tempTable = {}
    for key, value in pairs(objectList) do
      tempTable[#tempTable + 1] = key; --Store keys in another table
    end
    local index = tempTable[Random(#tempTable)];
    return objectList[index];
end

function Custom_Log(text)
    if true then
        return;
    end
    local logText = tostring(text);
    local logTimeStamp = os.date("%d, %m %Y %X");
    local popLog = io.open("Controlled_Recruitment_Pools.txt","a");

    popLog :write("CRP:  "..logText .. "   : [".. logTimeStamp .. "]\n");
    popLog :flush();
    popLog :close();
end

function Custom_Log_Finished()
    local popLog = io.open("Controlled_Recruitment_Pools.txt","a");

    popLog :write("CRP:  FINISHED\n\n");
    popLog :flush();
    popLog :close();
end