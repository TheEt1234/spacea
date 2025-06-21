-- An attempt to follow https://semver.org/
-- I mean like, dont be super sweaty about it, but the numbers should mean something
s.version = {
    is_dev = true,
    major = 0,
    minor = 1,
    patch = 0,
}

---@nodiscard
---@return string
function s.version.get_version()
    return ('%s.%s.%s-%s'):format(
        s.version.major,
        s.version.minor,
        s.version.patch,
        s.version.is_dev and 'dev' or 'release'
    )
end
