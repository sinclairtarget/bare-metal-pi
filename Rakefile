# ------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------
TOOLCHAIN = 'aarch64-elf'
SOURCE_DIR = 'src'
BUILD_DIR = 'build'

# ------------------------------------------------------------------------
# Directories
# ------------------------------------------------------------------------
directory BUILD_DIR             # intermediate directory for obj files
directory SOURCE_DIR

# ------------------------------------------------------------------------
# Files
# ------------------------------------------------------------------------
source_files = Rake::FileList["#{SOURCE_DIR}/*.s"]
obj_files = source_files.pathmap("%{^#{SOURCE_DIR},#{BUILD_DIR}}X.o")

# ------------------------------------------------------------------------
# Tasks
# ------------------------------------------------------------------------
task :default => :all

desc 'Build kernel.'
task :all => [BUILD_DIR, SOURCE_DIR, obj_files]

desc 'Clean up build.'
task :clean do
  sh "rm -rf #{BUILD_DIR}"
end

# ------------------------------------------------------------------------
# Rules
# ------------------------------------------------------------------------
rule '.o' => -> (f) { f.pathmap("%{^#{BUILD_DIR},#{SOURCE_DIR}}X.s") } do |t|
  sh "#{TOOLCHAIN}-as -I #{SOURCE_DIR} #{t.source} -o #{t.name}"
end
