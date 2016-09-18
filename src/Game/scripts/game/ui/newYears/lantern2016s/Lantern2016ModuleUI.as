package game.ui.newYears.lantern2016s
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Image;
   import morn.core.components.List;
   import morn.core.components.Label;
   import morn.core.components.Button;
   import game.ui.newYears.lantern2016s.render.LanternSalesRenderUI;
   
   public class Lantern2016ModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="832" height="533">
			  <Image skin="png.a5.comps.img_block" x="-45" y="-26" width="907" height="557" var="img_bg"/>
			  <Image skin="png.a5.comps.img_block" x="25" y="23" var="img_back" width="771" height="501"/>
			  <Image skin="png.a5.comps.img_block" x="127" y="-144" width="562" height="178" var="img_title"/>
			  <Image skin="png.a5.comps.img_block" x="-230" y="-89" width="616" height="628" var="img_person"/>
			  <List x="239" y="119" repeatX="2" repeatY="3" spaceX="0" spaceY="7" var="list_sales">
			    <LanternSalesRender name="render" runtime="game.ui.newYears.lantern2016s.render.LanternSalesRenderUI"/>
			  </List>
			  <Label text="没有\nyou\nyou" autoSize="none" x="256" y="26" style="渐变1" width="486" height="78" size="15" bold="true" leading="3" var="label_title"/>
			  <Button skin="png.a5.btns.btn_closeS1" y="-2" stateNum="1" var="btn_close" x="800"/>
			  <Label text="活动时间：2016-02-22 00:00:00——2016-02-22 23:59:59" autoSize="none" x="256" y="95" style="小标题" var="label_time" width="475" height="20" align="left"/>
			</PopModuleView>;
       
      
      public var img_bg:Image = null;
      
      public var img_back:Image = null;
      
      public var img_title:Image = null;
      
      public var img_person:Image = null;
      
      public var list_sales:List = null;
      
      public var label_title:Label = null;
      
      public var btn_close:Button = null;
      
      public var label_time:Label = null;
      
      public function Lantern2016ModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.newYears.lantern2016s.render.LanternSalesRenderUI"] = LanternSalesRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
