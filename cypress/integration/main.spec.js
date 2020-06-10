describe('My First Test', () => {
  it('Does not do much!', async () => {
      cy.visit('http://localhost:1234');
      cy.get('#list').should('not.be.empty');
  });
});
