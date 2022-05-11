/*
En esta clase guardamos los HTML del caso 1 que van a mostrar informacion preestablecida a lo largo del juego
(Informacion inicial + feedbacks) en variables para su posterior uso.
*/

class Case2Html {
  String initialInfo = '''
  <p style="margin-bottom: 0cm;line-height: 100%;text-align: left;background: transparent;"><strong>Informaci&oacute;n inicial</strong></p>
  <p style="margin-bottom: 0cm;line-height: 100%;text-align: left;background: transparent;"><br></p>
  <p style="margin-bottom: 0cm;line-height: 100%;text-align: left;background: transparent;">Mujer de 48 a&ntilde;os sin RAMC. Como antecedentes destacan:</p>
  <ul>
      <li>
          <p style="margin-bottom: 0cm;line-height: 100%;text-align: left;background: transparent;">Hipotiroidismo en tratamiento sustitutivo</p>
      </li>
      <li>
          <p style="margin-bottom: 0cm;line-height: 100%;text-align: left;background: transparent;">Vit&iacute;ligo</p>
      </li>
      <li>
          <p style="margin-bottom: 0cm;line-height: 100%;text-align: left;background: transparent;">Por lo dem&aacute;s no cuenta antecedentes de cardio, neumo, hepato, nefro o gastropat&iacute;a.</p>
      </li>
  </ul>
  <p style="margin-bottom: 0cm;line-height: 100%;text-align: left;background: transparent;"><br></p>
  <p style="margin-bottom: 0cm;line-height: 100%;text-align: left;background: transparent;"><strong>Historia epidemiol&oacute;gica</strong>: Profesora de ingl&eacute;s (educaci&oacute;n secundaria). Vive sola en Huesca.</p>
  <p style="margin-bottom: 0cm;line-height: 100%;text-align: left;background: transparent;"><br></p>
  <p style="margin-bottom: 0cm;line-height: 100%;text-align: left;background: transparent;"><strong>Tratamiento habitual</strong>: Levotiroxina 75 mcg/24h</p>
  <p style="margin-bottom: 0cm;line-height: 100%;text-align: left;background: transparent;"><br></p>
  <p style="margin-bottom: 0cm;line-height: 100%;text-align: left;background: transparent;"><strong>Enfermedad actual</strong>: Hace 2 d&iacute;as comienza con disuria y polaquiuria. Ayer comienza con dolor en fosa renal derecha irradiado a regi&oacute;n inguinal ipsilateral. Asocia adem&aacute;s fiebre y tiritona franca e hiporexia. Cuenta n&aacute;useas y ha vomitado en una ocasi&oacute;n. Acude a Urgencias.</p>
  <p style="margin-bottom: 0cm;line-height: 100%;text-align: left;background: transparent;"><br></p>
  <p style="margin-bottom: 0cm;line-height: 100%;text-align: left;background: transparent;"><strong>Exploraci&oacute;n f&iacute;sica</strong>: TA 110/80; FC 110 lpm; T&ordf; 38,6; FR: 20 Sat O2 98% con aire ambiental; Talla 160 cms. Peso 55 Kg. A la exploraci&oacute;n, impresiona de postramiento. AC: RCRs a 110 lpm sin soplos. AP: Murmullo vesicular conservado. Abdomen: blando y depresible, no doloroso. Ruidos hidroa&eacute;reos normales. Pu&ntilde;opercusi&oacute;n renal derecha positiva. No edemas ni signos de TVP.</p>
  <p style="margin-bottom: 0cm;line-height: 100%;text-align: left;background: transparent;"><br></p>
  <p style="margin-bottom: 0cm;line-height: 100%;text-align: left;background: transparent;"><strong>An&aacute;lisis en Urgencias</strong>: Hb 15,8; Leucocitos 18.200/mm<sup>3</sup> (N 88%; L 8%); Plaquetas 192.000. Na 138; K 4,2; urea 0,7; creatinina 1,2 mg/dL; AST 15; ALT 18; GGT 40; LDH 225; PCR &gt;350 mg/dL.&nbsp;GV: pH 7,38 pO2 62; pCO2 38; HCO3 22; lactato 2. Sedimento urinario: piuria.</p>
  <p style="margin-bottom: 0cm;line-height: 100%;text-align: left;background: transparent;"><br></p>
  <p style="margin-bottom: 0cm;line-height: 100%;text-align: left;background: transparent;"><strong>Rx de t&oacute;rax</strong>: &Iacute;ndice cardiotor&aacute;cico y silueta card&iacute;aca normales. No aparentes infiltrados ni derrame.</p>
  ''';

  String firstFeedback = '''
  <p style="margin-bottom: 0cm;line-height: 100%;text-align: left;background: transparent;">Para el diagn&oacute;stico de una pielonefritis aguda que precisa ingreso o de una sepsis urinaria est&aacute; indicada la solicitud de urocultivo (la prueba diagn&oacute;stica m&aacute;s rentable para alcanzar el diagn&oacute;stico etiol&oacute;gico) y hemocultivos (al menos dos extracciones).</p>
  <p style="margin-bottom: 0cm;line-height: 100%;text-align: left;background: transparent;"><br></p>
  <p style="margin-bottom: 0cm;line-height: 100%;text-align: left;background: transparent;">Es muy importante garantizar que la muestra de orina sea obtenida en las <u><a href="https://proantibioticos.com/2019/04/09/el-urocultivo/"><strong>condiciones adecuadas</strong></a></u> y que sea procesada con la mayor prontitud posible.</p>
  <p style="margin-bottom: 0cm;line-height: 100%;text-align: left;background: transparent;"><br></p>
  <p style="margin-bottom: 0cm;line-height: 100%;text-align: left;background: transparent;">Existe indicaci&oacute;n de una prueba de imagen si la evoluci&oacute;n es desfavorable o si se sospecha la existencia de uropat&iacute;a obstructiva. Debido a la similitud en la presentaci&oacute;n con un c&oacute;lico nefr&iacute;tico con infecci&oacute;n asociada, podr&iacute;a estar indicada la realizaci&oacute;n de una prueba de imagen en este caso. Salvo situaciones concretas, la ecograf&iacute;a es la primera prueba de imagen a realizar</p>
  ''';

  String secondFeedback = '''
  <table cellpadding="7" cellspacing="0" width="566">
      <tbody>
          <tr>
              <td bgcolor="#d9d9d9" style="background: #d9d9d9;" width="13.51931330472103%">
                  <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: left;background: transparent;"><strong>Antibi&oacute;tico</strong></p>
              </td>
              <td bgcolor="#d9d9d9" style="background: #d9d9d9;" width="6.437768240343348%">
                  <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: left;background: transparent;"><strong>Dosis</strong></p>
              </td>
              <td bgcolor="#d9d9d9" style="background: #d9d9d9;" width="3.8626609442060085%">
                  <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: left;background: transparent;"><strong>V&iacute;a</strong></p>
              </td>
              <td bgcolor="#d9d9d9" style="background: #d9d9d9;" width="10.729613733905579%">
                  <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: left;background: transparent;"><strong>Intervalo</strong></p>
              </td>
              <td bgcolor="#d9d9d9" style="background: #d9d9d9;" width="7.725321888412017%">
                  <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: left;background: transparent;"><strong>Activo</strong></p>
              </td>
              <td bgcolor="#d9d9d9" style="background: #d9d9d9;" width="39.05579399141631%">
                  <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: left;background: transparent;"><strong>Comentario</strong></p>
              </td>
              <td bgcolor="#d9d9d9" style="background: #d9d9d9;" width="18.669527896995707%">
                  <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: left;background: transparent;"><strong>Consecuencia</strong></p>
              </td>
          </tr>
          <tr>
              <td style="border: 1px solid #000000;padding: 0cm 0.19cm;" width="13.51931330472103%">
                  <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: center;background: transparent;">Ampicilina</p>
              </td>
              <td style="border: 1px solid #000000;padding: 0cm 0.19cm;" width="6.437768240343348%">
                  <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: center;background: transparent;">2g</p>
              </td>
              <td style="border: 1px solid #000000;padding: 0cm 0.19cm;" width="3.8626609442060085%">
                  <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: center;background: transparent;">IV</p>
              </td>
              <td style="border: 1px solid #000000;padding: 0cm 0.19cm;" width="10.729613733905579%">
                  <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: center;background: transparent;">c/6h</p>
              </td>
              <td style="border: 1px solid #000000;padding: 0cm 0.19cm;" width="7.725321888412017%">
                  <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: center;background: transparent;">S&iacute;</p>
              </td>
              <td style="border: 1px solid #000000;padding: 0cm 0.19cm;" width="39.05579399141631%">
                  <p style="margin-bottom: 0cm;line-height: 115%;text-align: left;background: transparent;"><strong>Tratamiento sub&oacute;ptimo</strong></p>
                  <p style="margin-bottom: 0cm;line-height: 115%;text-align: left;background: transparent;"><br></p>
                  <p style="margin-bottom: 0cm;line-height: 115%;text-align: left;background: transparent;">&gt; 50% de <em>E. coli</em> en nuestro entorno puede ser resistente a ampicilina.</p>
                  <p style="margin-bottom: 0cm;line-height: 115%;text-align: left;background: transparent;"><br></p>
                  <p style="margin-bottom: 0cm;line-height: 115%;text-align: left;background: transparent;">La decisi&oacute;n de usar este antibi&oacute;tico de forma emp&iacute;rica es arriesgada</p>
                  <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: left;background: transparent;"><br></p>
              </td>
              <td style="border: 1px solid #000000;padding: 0cm 0.19cm;" width="18.669527896995707%">
                  <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: left;background: transparent;">Pierde un 20% de vida</p>
              </td>
          </tr>
          <tr>
              <td style="border: 1px solid #000000;padding: 0cm 0.19cm;" width="13.51931330472103%">
                  <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: center;background: transparent;">Amoxicilina</p>
              </td>
              <td style="border: 1px solid #000000;padding: 0cm 0.19cm;" width="6.437768240343348%">
                  <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: center;background: transparent;">1g</p>
              </td>
              <td style="border: 1px solid #000000;padding: 0cm 0.19cm;" width="3.8626609442060085%">
                  <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: center;background: transparent;">VO</p>
              </td>
              <td style="border: 1px solid #000000;padding: 0cm 0.19cm;" width="10.729613733905579%">
                  <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: center;background: transparent;">c/8h</p>
              </td>
              <td style="border: 1px solid #000000;padding: 0cm 0.19cm;" width="7.725321888412017%">
                  <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: center;background: transparent;">S&iacute;</p>
              </td>
              <td style="border: 1px solid #000000;padding: 0cm 0.19cm;" width="39.05579399141631%">
                  <p style="margin-bottom: 0cm;line-height: 115%;text-align: left;background: transparent;"><strong>V&iacute;a inadecuada</strong>.</p>
                  <p style="margin-bottom: 0cm;line-height: 115%;text-align: left;background: transparent;"><br></p>
                  <p style="margin-bottom: 0cm;line-height: 115%;text-align: left;background: transparent;">&gt; 50% de <em>E. coli</em> (microorganismo esperable) en nuestro entorno puede ser resistente a ampicilina.</p>
                  <p style="margin-bottom: 0cm;line-height: 115%;text-align: left;background: transparent;"><br></p>
                  <p style="margin-bottom: 0cm;line-height: 115%;text-align: left;background: transparent;">La decisi&oacute;n de usar este antibi&oacute;tico de forma emp&iacute;rica es arriesgada.</p>
                  <p style="margin-bottom: 0cm;line-height: 115%;text-align: left;background: transparent;"><br></p>
                  <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: left;background: transparent;">En pacientes con pielonefritis aguda que precisan ingreso es m&aacute;s adecuada la v&iacute;a intravenosa hasta comprobar estabilidad cl&iacute;nica.</p>
              </td>
              <td style="border: 1px solid #000000;padding: 0cm 0.19cm;" width="18.669527896995707%">
                  <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: left;background: transparent;">Pierde un 20% de vida</p>
              </td>
          </tr>
          <tr>
              <td style="border: 1px solid #000000;padding: 0cm 0.19cm;" width="13.51931330472103%">
                  <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: left;background: transparent;">Ceftriaxona</p>
              </td>
              <td style="border: 1px solid #000000;padding: 0cm 0.19cm;" width="6.437768240343348%">
                  <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: left;background: transparent;">2g</p>
              </td>
              <td style="border: 1px solid #000000;padding: 0cm 0.19cm;" width="3.8626609442060085%">
                  <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: left;background: transparent;">IV</p>
              </td>
              <td style="border: 1px solid #000000;padding: 0cm 0.19cm;" width="10.729613733905579%">
                  <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: left;background: transparent;">c/24h</p>
              </td>
              <td style="border: 1px solid #000000;padding: 0cm 0.19cm;" width="7.725321888412017%">
                  <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: center;background: transparent;"><strong>S&iacute;</strong></p>
              </td>
              <td style="border: 1px solid rgb(0, 0, 0);padding: 0cm 0.19cm;vertical-align: top;" valign="top" width="39.05579399141631%">
                  <p style="margin-bottom: 0cm;line-height: 115%;text-align: left;background: transparent;"><strong>Tratamiento &oacute;ptimo:</strong></p>
                  <p style="margin-bottom: 0cm;line-height: 115%;text-align: left;background: transparent;"><br></p>
                  <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: left;background: transparent;">Ceftriaxona es un buen antibi&oacute;tico para una pielonefritis aguda y adem&aacute;s es activo frente a m&aacute;s del 85% de <em>E. coli</em>, que es la principal etiolog&iacute;a esperable</p>
              </td>
              <td style="border: 1px solid #000000;padding: 0cm 0.19cm;" width="18.669527896995707%">
                  <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: left;background: transparent;">Ninguna</p>
              </td>
          </tr>
      </tbody>
  </table>
  ''';

  String thirdFeedback = '''
  <table cellpadding="7" cellspacing="0" width="566">
      <tbody>
          <tr>
              <td bgcolor="#d9d9d9" style="background: #d9d9d9;" width="13.51931330472103%">
                  <table cellpadding="7" cellspacing="0" width="530">
                      <tbody>
                          <tr>
                              <td bgcolor="#d9d9d9" style="background: #d9d9d9;" width="22.790697674418606%">
                                  <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: left;background: transparent;"><strong>Antibi&oacute;tico</strong></p>
                              </td>
                              <td bgcolor="#d9d9d9" style="background: #d9d9d9;" width="12.093023255813954%">
                                  <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: left;background: transparent;"><strong>Dosis</strong></p>
                              </td>
                              <td bgcolor="#d9d9d9" style="background: #d9d9d9;" width="7.674418604651163%">
                                  <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: left;background: transparent;"><strong>V&iacute;a</strong></p>
                              </td>
                              <td bgcolor="#d9d9d9" style="background: #d9d9d9;" width="16.511627906976745%">
                                  <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: left;background: transparent;"><strong>Intervalo</strong></p>
                              </td>
                              <td bgcolor="#d9d9d9" style="background: #d9d9d9;" width="10%">
                                  <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: left;background: transparent;"><strong>Activo</strong></p>
                              </td>
                              <td bgcolor="#d9d9d9" style="background: #d9d9d9;" width="10%">
                                  <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: left;background: transparent;"><strong>D&iacute;as</strong></p>
                              </td>
                              <td bgcolor="#d9d9d9" style="background: #d9d9d9;" width="20.930232558139537%">
                                  <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: left;background: transparent;"><strong>Consecuencia</strong></p>
                              </td>
                          </tr>
                          <tr>
                              <td style="border: 1px solid #000000;padding: 0cm 0.19cm;" width="22.790697674418606%">
                                  <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: left;background: transparent;"><strong>Ampicilina</strong></p>
                              </td>
                              <td style="border: 1px solid #000000;padding: 0cm 0.19cm;" width="12.093023255813954%">
                                  <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: left;background: transparent;">2g</p>
                              </td>
                              <td style="border: 1px solid #000000;padding: 0cm 0.19cm;" width="7.674418604651163%">
                                  <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: left;background: transparent;">IV</p>
                              </td>
                              <td style="border: 1px solid #000000;padding: 0cm 0.19cm;" width="16.511627906976745%">
                                  <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: left;background: transparent;">c/6h</p>
                              </td>
                              <td style="border: 1px solid #000000;padding: 0cm 0.19cm;" width="10%">
                                  <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: left;background: transparent;">S&iacute;</p>
                              </td>
                              <td style="border: 1px solid #000000;padding: 0cm 0.19cm;" width="10%">
                                  <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: left;background: transparent;">N*</p>
                              </td>
                              <td style="border: 1px solid #000000;padding: 0cm 0.19cm;" width="20.930232558139537%">
                                  <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: left;background: transparent;">Si N&le;2 Pierde 20% de vida</p>
                              </td>
                          </tr>
                          <tr>
                              <td style="border: 1px solid #000000;padding: 0cm 0.19cm;" width="22.790697674418606%">
                                  <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: left;background: transparent;"><strong>Amoxicilina</strong></p>
                              </td>
                              <td style="border: 1px solid #000000;padding: 0cm 0.19cm;" width="12.093023255813954%">
                                  <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: left;background: transparent;">1g</p>
                              </td>
                              <td style="border: 1px solid #000000;padding: 0cm 0.19cm;" width="7.674418604651163%">
                                  <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: left;background: transparent;">VO</p>
                              </td>
                              <td style="border: 1px solid #000000;padding: 0cm 0.19cm;" width="16.511627906976745%">
                                  <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: left;background: transparent;">c/8h</p>
                              </td>
                              <td style="border: 1px solid #000000;padding: 0cm 0.19cm;" width="10%">
                                  <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: left;background: transparent;">S&iacute;</p>
                              </td>
                              <td style="border: 1px solid #000000;padding: 0cm 0.19cm;" width="10%">
                                  <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: left;background: transparent;">N*</p>
                              </td>
                              <td style="border: 1px solid #000000;padding: 0cm 0.19cm;" width="20.930232558139537%">
                                  <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: left;background: transparent;">Si N&le;2 Pierde 20% de vida</p>
                              </td>
                          </tr>
                      </tbody>
                  </table>
              </td>
              <td bgcolor="#d9d9d9" style="background: #d9d9d9;" width="6.437768240343348%"><br></td>
              <td bgcolor="#d9d9d9" style="background: #d9d9d9;" width="3.8626609442060085%"><br></td>
              <td bgcolor="#d9d9d9" style="background: #d9d9d9;" width="10.729613733905579%"><br></td>
              <td bgcolor="#d9d9d9" style="background: #d9d9d9;" width="7.725321888412017%"><br></td>
              <td bgcolor="#d9d9d9" style="background: #d9d9d9;" width="39.05579399141631%"><br></td>
              <td bgcolor="#d9d9d9" style="background: #d9d9d9;" width="18.669527896995707%"><br></td>
          </tr>
          <tr>
              <td style="border: 1px solid #000000;padding: 0cm 0.19cm;" width="13.51931330472103%"><br></td>
              <td style="border: 1px solid #000000;padding: 0cm 0.19cm;" width="6.437768240343348%"><br></td>
              <td style="border: 1px solid #000000;padding: 0cm 0.19cm;" width="3.8626609442060085%"><br></td>
              <td style="border: 1px solid #000000;padding: 0cm 0.19cm;" width="10.729613733905579%"><br></td>
              <td style="border: 1px solid #000000;padding: 0cm 0.19cm;" width="7.725321888412017%"><br></td>
              <td style="border: 1px solid rgb(0, 0, 0);padding: 0cm 0.19cm;vertical-align: top;" valign="top" width="39.05579399141631%"><br></td>
              <td style="border: 1px solid #000000;padding: 0cm 0.19cm;" width="18.669527896995707%">
                  <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: left;background: transparent;"><br></p>
              </td>
          </tr>
      </tbody>
  </table>
  ''';
}
