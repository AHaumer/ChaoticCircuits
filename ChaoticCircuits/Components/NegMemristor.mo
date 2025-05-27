within ChaoticCircuits.Components;
model NegMemristor "Memristor with partly negative resistance"
  extends ChaoticCircuits.BaseModels.BaseMemristor(q(start=0.1));
  parameter SI.Resistance R0=1.5 "Parameter beta";
  parameter SI.Current I0=0.6 "Parameter alpha";
equation
  Rmem = R0*(q^2 - 1);
  der(q) = i*(1 - q) - I0*q;
  annotation (defaultComponentName="memristor",
    Icon(graphics={
        Line(points={{-34,-31},{-43,-14},{-51,6},{-60,30}}, color={0,0,0},
          smooth=Smooth.Bezier),
        Line(
          points={{0,-60},{-9,-58},{-17,-53},{-26,-43},{-34,-31}},
          color={238,46,47},
          smooth=Smooth.Bezier),
        Line(
          points={{0,-60},{9,-58},{17,-53},{26,-43},{34,-31}},
          color={238,46,47},
          smooth=Smooth.Bezier),
        Line(points={{34,-31},{43,-14},{51,6},{60,30}},     color={0,0,0},
          smooth=Smooth.Bezier)}),                       Documentation(info="<html>
<p>
This memristor model was suggested by <a href=\"modelica://ChaoticCircuits.UsersGuide.References\"> [Muthuswamy2010] </a> 
to construct the &quot;<a href=\"modelica://ChaoticCircuits.SimplestChaoticCircuit\">Simplest Chaotic Circuit</a>&quot;.
</p>
</html>"));
end NegMemristor;
