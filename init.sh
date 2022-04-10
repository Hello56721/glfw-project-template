# Compile GLFW.
cmake -S glfw -B glfw -D BUILD_SHARED_LIBS=true -D GLFW_BUILD_TESTS=false -D GLFW_BUILD_EXAMPLES=false
cmake --build glfw

# Generate project files
cmake .