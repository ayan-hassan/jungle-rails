describe ("Jungle App add to cart", () => {
  beforeEach(() => {
    cy.visit('http://localhost:3000/')
  })
  it('should click "add to cart" and cart increases by one', () => {
    //get initial cart count as text
    cy.contains("My Cart (0)").should("exist")

    // Click on the "Add to Cart" button for a product
    cy.get('.btn').first().click({force: true});

    // Confirm old cart doesn't exist and that new cart is updated by one
    cy.contains("My Cart (0)").should("not.exist")
    cy.contains("My Cart (1)").should("exist")
  })
})