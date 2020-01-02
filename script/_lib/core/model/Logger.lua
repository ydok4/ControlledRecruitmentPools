Logger = {
    FileName = "CustomLog.txt",
    EnableLogging = false,
}

function Logger:new (o)
    o = o or {};
    setmetatable(o, self);
    self.__index = self;
    return o;
end

function Logger:Initialise(fileName, enableLogging)
    self.FileName = fileName;
    if enableLogging == nil then
        self.EnableLogging = false;
    else
        self.EnableLogging = enableLogging;
    end
end

function Logger:Log_Start()
    if self.EnableLogging == true then
        io.open(self.FileName,"w"):close();
    end
end

function Logger:Log(text)
    if self.EnableLogging == true then
        local logText = tostring(text);
        local logTimeStamp = os.date("%d, %m %Y %X");
        local popLog = io.open(self.FileName, "a");

        popLog:write(logText .. "   : [".. logTimeStamp .. "]\n");
        popLog:flush();
        popLog:close();
    end
end

function Logger:Log_Finished()
    if self.EnableLogging == true then
        local popLog = io.open(self.FileName, "a");

        popLog:write("FINISHED\n\n");
        popLog:flush();
        popLog:close();
    end
end