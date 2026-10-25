test_that("available years has 2024 to 2031 inclusive", {

  expect_equal(unlist(available_years),
               c("2024", "2025", "2026", "2027", "2028", "2029", "2030", "2031"))

})
