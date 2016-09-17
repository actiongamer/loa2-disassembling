package game.ui.newYears.valentine2016s
{
   import morn.customs.components.PopModuleView;
   import morn.customs.components.GRect;
   import morn.core.components.Box;
   import morn.core.components.Image;
   import morn.core.components.Button;
   import game.ui.commons.icons.WealthRenderS9UI;
   import morn.core.components.Label;
   import morn.core.components.List;
   import game.ui.commons.comps.pageBars.PageBarS2UI;
   import game.ui.newYears.valentine2016s.render.ValentineSalesRenderUI;
   
   public class Valentine2016ModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="804" height="551">
			  <Image skin="png.uiValentine2016.大底框" x="-71" y="-1"/>
			  <Image skin="png.uiValentine2016.标题头" x="126" y="-108"/>
			  <GRect fillAlpha="0.5" radius="0,0,0,0" lineAlpha="0" x="16" y="43" width="800" height="503" var="mask_render1"/>
			  <GRect fillAlpha="0.5" radius="0,0,0,0" lineAlpha="0" x="16" y="43" width="800" height="503" var="mask_render2"/>
			  <Box x="16" y="49" var="box_event1">
			    <Image skin="png.a5.comps.img_block" width="256" height="498" var="img_angel1" x="15"/>
			    <Image skin="png.a5.comps.img_block" x="271" width="256" height="498" var="img_angel2"/>
			    <Image skin="png.a5.comps.img_block" x="527" width="256" height="498" var="img_angel3"/>
			    <Image skin="png.uiValentine2016.分割线-2" x="266" mouseChildren="false" mouseEnabled="false" y="59"/>
			    <Image skin="png.uiValentine2016.分割线-2" x="522" mouseChildren="false" mouseEnabled="false" y="59"/>
			    <Image skin="png.uiValentine2016.文字底" x="15"/>
			    <Label text="\l13320003" autoSize="none" x="149" y="8" style="普通说明" align="center" width="500"/>
			    <Box x="32" y="330">
			      <Button skin="png.uiValentine2016.送花按钮" x="73" stateNum="1" var="btn_give1"/>
			      <Image skin="png.uiValentine2016.透明底" y="52"/>
			      <WealthRenderS9 x="13" y="86" var="render_flower1" runtime="game.ui.commons.icons.WealthRenderS9UI"/>
			      <Label text="向女神\n获得" autoSize="none" x="85" y="93" var="label_flower1" style="普通说明" align="left" width="150" height="49" leading="5"/>
			    </Box>
			    <Box x="287" y="331">
			      <Button skin="png.uiValentine2016.送花按钮" x="73" stateNum="1" var="btn_give2"/>
			      <Image skin="png.uiValentine2016.透明底" y="52"/>
			      <WealthRenderS9 x="13" y="86" var="render_flower2" runtime="game.ui.commons.icons.WealthRenderS9UI"/>
			      <Label text="向女神\n获得" autoSize="none" x="85" y="93" var="label_flower2" style="普通说明" align="left" width="150" height="49" leading="5"/>
			    </Box>
			    <Box x="542" y="331">
			      <Button skin="png.uiValentine2016.送花按钮" x="73" stateNum="1" var="btn_give3"/>
			      <Image skin="png.uiValentine2016.透明底" y="52"/>
			      <WealthRenderS9 x="13" y="86" var="render_flower3" runtime="game.ui.commons.icons.WealthRenderS9UI"/>
			      <Label text="向女神\n获得" autoSize="none" x="85" y="93" var="label_flower3" style="普通说明" align="left" width="150" height="49" leading="5"/>
			    </Box>
			    <Image skin="png.uiValentine2016.边光" y="33"/>
			    <Image skin="png.uiValentine2016.边光" x="770" y="33"/>
			  </Box>
			  <Image skin="png.a5.comps.img_block" x="31" y="51" var="img_saleBg" width="768" height="496"/>
			  <Box x="-202" y="-102" var="box_event2">
			    <Image skin="png.a5.comps.img_block" width="560" height="659" var="img_person"/>
			    <List x="445" y="244" repeatX="2" repeatY="3" spaceX="0" spaceY="7" var="list_sales">
			      <ValentineSalesRender name="render" runtime="game.ui.newYears.valentine2016s.render.ValentineSalesRenderUI"/>
			    </List>
			    <Image skin="png.uiValentine2016.下透明底" x="387" y="597" width="590" height="52"/>
			    <PageBarS2 x="652" y="614" var="pageBarUI" runtime="game.ui.commons.comps.pageBars.PageBarS2UI"/>
			    <Label text="\l13320005" autoSize="none" x="479" y="166" style="TAB暗" width="300" height="57" size="15" bold="true" leading="-1"/>
			    <Image skin="png.uiValentine2016.边光" x="988" y="174"/>
			  </Box>
			  <Box x="343" y="43" var="box_eventTitle2">
			    <Image skin="png.a5.comps.img_block" var="img_eventTitle2" y="7" width="455" height="498"/>
			    <Image skin="png.uiValentine2016.情人节特惠" x="72" y="243"/>
			    <Image skin="png.uiValentine2016.边光" x="440" y="0"/>
			  </Box>
			  <Box x="16" y="43" var="box_eventTitle1">
			    <Image skin="png.a5.comps.img_block" y="7" var="img_eventTitle1" x="15" width="456" height="498"/>
			    <Image skin="png.uiValentine2016.女神之约" y="201" x="14"/>
			    <Image skin="png.uiValentine2016.分割线" x="323" y="0"/>
			    <Image skin="png.uiValentine2016.边光" y="1"/>
			  </Box>
			  <Image skin="png.uiValentine2016.分割线2" x="134" y="539"/>
			  <Button skin="png.a5.btns.btn_closeS1" y="21" stateNum="1" var="btn_close" x="804"/>
			</PopModuleView>;
       
      
      public var mask_render1:GRect = null;
      
      public var mask_render2:GRect = null;
      
      public var box_event1:Box = null;
      
      public var img_angel1:Image = null;
      
      public var img_angel2:Image = null;
      
      public var img_angel3:Image = null;
      
      public var btn_give1:Button = null;
      
      public var render_flower1:WealthRenderS9UI = null;
      
      public var label_flower1:Label = null;
      
      public var btn_give2:Button = null;
      
      public var render_flower2:WealthRenderS9UI = null;
      
      public var label_flower2:Label = null;
      
      public var btn_give3:Button = null;
      
      public var render_flower3:WealthRenderS9UI = null;
      
      public var label_flower3:Label = null;
      
      public var img_saleBg:Image = null;
      
      public var box_event2:Box = null;
      
      public var img_person:Image = null;
      
      public var list_sales:List = null;
      
      public var pageBarUI:PageBarS2UI = null;
      
      public var box_eventTitle2:Box = null;
      
      public var img_eventTitle2:Image = null;
      
      public var box_eventTitle1:Box = null;
      
      public var img_eventTitle1:Image = null;
      
      public var btn_close:Button = null;
      
      public function Valentine2016ModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.pageBars.PageBarS2UI"] = PageBarS2UI;
         viewClassMap["game.ui.commons.icons.WealthRenderS9UI"] = WealthRenderS9UI;
         viewClassMap["game.ui.newYears.valentine2016s.render.ValentineSalesRenderUI"] = ValentineSalesRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
