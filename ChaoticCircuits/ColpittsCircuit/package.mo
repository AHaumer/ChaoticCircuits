within ChaoticCircuits;
package ColpittsCircuit "The Colpitts Circuit"
  extends Modelica.Icons.ExamplesPackage;

   annotation (preferredView="info", Documentation(info="<html>
<p>Colpitts' circuit is a simple nonlinear circuit which shows chaotic behaviour, based on a transistor.</p>
<p>
Plot v1 vs. v2. 
Default parameter <code>R1 = 75 &#8486;</code> shows periodic results with chaotic traces within a certain band. 
Change parameter <code>R1 = 35 &#8486;</code> to obtain chaotic results. 
</p>
<p><b>Note</b> that initial condition = 0 is sufficient!</p>
<p><strong>Reference:</strong></p>
<ul>
<li>Arturo Buscarino, Luigi Fortuna, Mattia Frasca and Gregorio Sciuto: 
    <a href=\"https://link.springer.com/book/10.1007/978-3-319-05900-6\">A Concise Guide to Chaotic Electronic Components</a>.
    Chapter 1.3 The Chaotic Colpitts Circuit. 
    Springer Briefs in Applied Sciences and Technology 2014, ISBN 978-3-319-05899-3, ISSN 2191-530X, DOI 10.1007/978-3-319-05900-6</li>
</html>"));
end ColpittsCircuit;
