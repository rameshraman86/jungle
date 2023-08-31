describe('Product Page', () => {
  beforeEach(() => {
    // Visit the product page before each test
    cy.visit('http://localhost:3000');
  });

  it('displays sold-out product correctly', () => {
    // Assuming you have a sold-out product with quantity 0
    // Assert the disabled button and the "Sold Out" text
    cy.contains('button', 'Sold Out').should('be.disabled');
  });

  it('displays available product correctly', () => {
    // Assuming you have an available product with quantity greater than 0
    // Assert the active "Add" button
    cy.contains('btn', 'Submit').should('not.be.disabled');
  });

});
