within ChaoticCircuits;
package JerkCircuit "The Jerk equation"
  extends Modelica.Icons.ExamplesPackage;
  annotation (preferredView="info", Documentation(info="<html>
<p>
The name of the system stems from the third derivative of x, which – in a mechanical system – is the derivative of acceleration called jerk.
</p>
<p>
The Jerk equation has been investigated in different versions. 
The version implemented here uses a diode as described in
<a href=\"modelica://ChaoticCircuits.UsersGuide.References\"> [Buscarino] </a> and 
<a href=\"modelica://ChaoticCircuits.UsersGuide.References\"> [Sprott2011] </a>.<br>
Nice feature: The layout is quite simple, it should not be very challenging to create a PCB.
</p>
<p>
Plot x vs. y vs. z. <br>
Default parameter <code>A = 0.3</code> shows periodic results. <br>
Change parameter <code>A = 1.0</code> to obtain chaotic results. 
</p>
</html>"));
end JerkCircuit;
