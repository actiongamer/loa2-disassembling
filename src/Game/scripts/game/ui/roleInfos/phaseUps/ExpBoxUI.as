package game.ui.roleInfos.phaseUps
{
   import morn.core.components.View;
   import morn.customs.components.GCircle;
   import morn.customs.components.GRect;
   import morn.customs.components.ClipList;
   
   public class ExpBoxUI extends View
   {
      
      protected static var uiView:XML = <View width="170" height="201">
			  <Image skin="png.uiRoleInfo.shenjie.img_waterBottom" x="-245" y="102"/>
			  <GCircle fillAlpha="0.5" lineAlpha="0" x="6" y="39" width="148" height="148" var="mask_water"/>
			  <GRect fillAlpha="0.5" radius="0,0,0,0" lineAlpha="0" x="8" y="189" width="153" height="151" var="img_mask" scaleY="-0.2"/>
			  <Image skin="png.uiRoleInfo.img_circleBg" x="-55" y="14"/>
			  <ClipList value="2568" clipWidth="27" align="center" url="png.a5.comps.clipList.clipList_S5" x="79" y="88" var="txt_exp_value"/>
			</View>;
       
      
      public var mask_water:GCircle = null;
      
      public var img_mask:GRect = null;
      
      public var txt_exp_value:ClipList = null;
      
      public function ExpBoxUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         super.createChildren();
         createView(uiView);
      }
   }
}
