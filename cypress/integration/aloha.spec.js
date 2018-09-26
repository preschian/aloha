describe('tiny blog', () => {
  it('loads', () => {
    cy.visit('localhost:5000');
    cy.contains('h2', 'Top players by hero ⭐️');
  });
});
