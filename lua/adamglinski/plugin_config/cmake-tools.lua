return {
    'Civitasv/cmake-tools.nvim',
    config = function ()
        require("cmake-tools").setup({
            cmake_command = "C:/Program Files/CMake/bin/cmake.exe",
            cmake_build_directory = "build/${variant:buildType}",
            -- cmake_generate_options = ""
        })
    end
}
