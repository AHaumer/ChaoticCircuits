within ChaoticCircuits.Components;
model NegFCMemristor
  "Flux-controlled Memristor with partly negative conductance"
  extends ChaoticCircuits.BaseModels.FluxControlledMemristor;
  parameter Real alpha=-0.667e-3 "Coefficient alpha of conductance";
  parameter Real beta = 0.029e-3 "Coefficient beta  of conductance";
  parameter SI.MagneticFlux PhiRef=8200*47e-9/10 "Flux scaling parameter";
  Real x(start=0)=phi/PhiRef "Dimensionless state";
protected
  parameter SI.Conductance GRef=1;
equation
  Gmem = GRef*(alpha + 3*beta*x^2);
  PhiRef*der(x) = v;
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
This memristor model was suggested by <a href=\"modelica://ChaoticCircuits.UsersGuide.References\"> [Muthuswamy2010a] </a>
to replace Chua&apos; diode.
</p>
</html>"));
end NegFCMemristor;
