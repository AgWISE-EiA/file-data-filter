# file-data-filter

R script showcasing filtering of data in data frame using **dplyr** and dynamic filter values and comparators



### Using `renv` in R

`renv` is an R package that helps manage project-specific R environments and dependencies. It ensures reproducibility and avoids conflicts between packages. Here are the steps to use `renv` in your R projects:

1. **Installation**:

   Install the `renv` package using the following command:

   ```
   install.packages("renv")
   ```

2. **Initialize an `renv` Project**:

   - Open your R project directory or create a new one.
   - In R, run:

     ```
     library(renv)
     renv::init()
     ```

   This sets up an isolated R environment for your project.

3. **Installing Packages**:

   Install packages for your project using `renv::install`. Example:

   ```
   renv::install("package_name")
   ```

4. **Working with the Project**:

   - Open your project from within its directory.
   - Use RStudio's "File" > "Open Project" or set the working directory:

     ```
     setwd("path/to/your/project")
     ```

5. **Saving and Sharing the Environment**:

   - Save the `renv.lock` file to list package versions:

     ```
     renv::snapshot()
     ```

   Share this file with collaborators.

6. **Updating Packages**:

   Update packages in your project with:

   ```
   renv::update()
   ```

   This updates packages while keeping track of versions in `renv.lock`.

7. **Deactivating `renv`**:

   To deactivate `renv` for the current session:

   ```
   renv::deactivate()
   ```

   This returns to the global R environment.

These steps help manage package dependencies in R projects, ensuring reproducibility and avoiding conflicts.
