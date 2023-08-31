describe('Product Page', () => {
  beforeEach(() => {
    // Visit the product page before each test
    cy.visit('http://localhost:3000');
  });


  it('adds product to cart when "Add" button is clicked', () => {
    // Assuming you have an available product with quantity greater than 0
    // Click the "Add" button
    cy.contains('.btn', 'Add').click();

    // Assert that the cart is updated as expected (you might need to modify this assertion)
    cy.get('.#navbarSupportedContent > :nth-child(2) > :nth-child(2) > .nav-link').should('contain', '1 item'); // Update selector as needed
  });


});
