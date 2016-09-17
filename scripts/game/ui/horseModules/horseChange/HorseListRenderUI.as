package game.ui.horseModules.horseChange
{
   import morn.customs.components.HorseRender;
   import morn.core.components.Image;
   import game.ui.commons.comps.others.RedPointUI;
   
   public class HorseListRenderUI extends HorseRender
   {
      
      protected static var uiView:XML = <HorseRender width="68" height="68">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS4_2" x="3" y="3" var="img_quality" sizeGrid="6,6,6,6" width="62" height="62"/>
			  <Image skin="png.comp.image" x="8" y="8" var="img_icon" width="52" height="52"/>
			  <Image skin="png.uiHorse.0821.选中框02" name="selectBoxAll"/>
			  <RedPoint x="7" y="7" var="redPoint" runtime="game.ui.commons.comps.others.RedPointUI"/>
			  <Image skin="png.a5.commonImgs.img_lock" x="7" y="7" var="img_lock" scale="0.5"/>
			  <Image skin="png.uiHorse.0821.已幻化" x="-12" y="-6" var="img_using"/>
			</HorseRender>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var redPoint:RedPointUI = null;
      
      public var img_lock:Image = null;
      
      public var img_using:Image = null;
      
      public function HorseListRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.others.RedPointUI"] = RedPointUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
