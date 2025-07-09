local function read_file(path)
  local file = io.open(path, "r")
  if not file then return nil end
  local content = file:read("*all")
  file:close()
  return content
end

local function parse_property(content, tag)
  local pattern = "<" .. tag .. ">(.-)</" .. tag .. ">"
  return content:match(pattern)
end

local function find_csproj()
  for file in io.popen('find . -maxdepth 1 -name "*.csproj"'):lines() do
    return file
  end
  error("No .csproj file found in current directory.")
end

local function get_dotnet_build_info()
  local csproj = find_csproj()
  if not csproj then
    error("Failed to find csproj")
  end

  local content = read_file(csproj)
  if not content then
    error("Failed to read .csproj file")
  end

  local framework = parse_property(content, "TargetFramework")
  if not framework then
    error("Could not find <TargetFramework> in .csproj")
  end

  local assembly = parse_property(content, "AssemblyName")
  if not assembly then
    -- Default assembly name from .csproj file name
    assembly = csproj:match("([^/]+)%.csproj$")
  end

  local outputPath = parse_property(content, "OutputPath")
  if not outputPath then
    -- Default MSBuild output path
    outputPath = "bin/Debug/" .. framework .. "/"
  end

  -- Make sure path is relative to project folder
  local cwd = vim.fn.getcwd()
  local exePath = cwd .. "/" .. outputPath .. assembly .. ".dll"

  return {
    csproj = csproj,
    framework = framework,
    assembly = assembly,
    outputPath = outputPath,
    exePath = exePath
  }
end

return {
  get_dotnet_build_info = get_dotnet_build_info
}
