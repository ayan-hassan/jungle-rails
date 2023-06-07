describe ("Jungle App", () => {
  beforeEach(() => {
    cy.visit('http://localhost:3000/')
  })
  it('should visit the homepage', () => {
    cy.visit('http://localhost:3000');
  });
  it("There are products on the page", () => {
    cy.get(".products article").should("be.visible");
  });
})