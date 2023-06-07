describe ("Jungle App product details", () => {
  beforeEach(() => {
    cy.visit('http://localhost:3000/')
  })
  it('should visit the product details page from home page', () => {
    // Find the product element and click on it
    cy.get('.product-to-click').first().click();

    // Assert that the URL has changed to the product details page
    cy.url().should('include', '/products/');
  })
})