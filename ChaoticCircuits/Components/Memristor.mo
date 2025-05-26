within ChaoticCircuits.Components;
model Memristor "Memristor model"
  extends Modelica.Electrical.Analog.Interfaces.OnePort;
  extends Modelica.Icons.UnderConstruction;

  annotation (Icon(graphics={
        Text(
          extent={{-100,100},{100,70}},
          textColor={0,0,255},
          textString="%name"),
        Rectangle(
          extent={{-70,30},{70,-30}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-70,30},{-64,-30}},
          lineColor={0,0,255},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid),
        Line(points={{-90,0},{-58,0},{-58,-20},{-38,-20},{-38,20},{-18,20},{-18,
              -20},{2,-20},{2,20},{22,20},{22,-20},{42,-20},{42,20},{62,20},{62,
              0},{90,0}}, color={0,0,255})}));
end Memristor;
