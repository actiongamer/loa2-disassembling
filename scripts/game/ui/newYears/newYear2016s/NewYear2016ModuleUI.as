package game.ui.newYears.newYear2016s
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Box;
   import morn.customs.components.GRect;
   import morn.core.components.Button;
   
   public class NewYear2016ModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="840" height="526">
			  <Image skin="png.uiNewYear2016.img_bg" x="-69" y="-24"/>
			  <Box x="35" y="27" var="boxRender">
			    <NewYear2016Render x="512" var="render2UI" runtime="game.ui.newYears.newYear2016s.NewYear2016RenderUI"/>
			    <NewYear2016Render x="256" var="render1UI" runtime="game.ui.newYears.newYear2016s.NewYear2016RenderUI"/>
			    <NewYear2016Render var="render0UI" runtime="game.ui.newYears.newYear2016s.NewYear2016RenderUI"/>
			  </Box>
			  <GRect fillAlpha="0.5" radius="0,0,0,0" lineAlpha="0" x="35" y="27" width="768" height="498" var="mask_render"/>
			  <Image skin="png.uiNewYear2016.img_item1" x="776" y="0"/>
			  <Button stateNum="1" buttonMode="true" labelColors="0xd1cdbf,0xe1dfd6,0xada99b" labelSize="15" labelFont="SSZH" letterSpacing="2" skin="png.a5.btns.btn_closeS1" y="-1" x="815" var="btn_close"/>
			  <Image skin="png.uiNewYear2016.img_light_border" x="789" y="55"/>
			  <Image skin="png.uiNewYear2016.img_light_border" x="20" y="55"/>
			  <Image skin="png.uiNewYear2016.img_item2" x="-26" y="0"/>
			  <Image skin="png.uiNewYear2016.img_title" x="128" y="-132"/>
			</PopModuleView>;
       
      
      public var boxRender:Box = null;
      
      public var render2UI:game.ui.newYears.newYear2016s.NewYear2016RenderUI = null;
      
      public var render1UI:game.ui.newYears.newYear2016s.NewYear2016RenderUI = null;
      
      public var render0UI:game.ui.newYears.newYear2016s.NewYear2016RenderUI = null;
      
      public var mask_render:GRect = null;
      
      public var btn_close:Button = null;
      
      public function NewYear2016ModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.newYears.newYear2016s.NewYear2016RenderUI"] = game.ui.newYears.newYear2016s.NewYear2016RenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
