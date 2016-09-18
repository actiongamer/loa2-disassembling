package game.ui.petModule.comps
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import game.ui.commons.comps.others.RedPointUI;
   import morn.core.components.Box;
   
   public class PetListRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="68" height="68">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS4_2" x="3" y="3" var="img_quality" sizeGrid="6,6,6,6" width="62" height="62"/>
			  <Image skin="png.comp.image" x="8" y="8" var="img_icon" width="52" height="52"/>
			  <Image skin="png.uiPet.selected" name="selectBoxAll"/>
			  <RedPoint x="1" y="-1" var="redPoint" runtime="game.ui.commons.comps.others.RedPointUI"/>
			  <Image skin="png.a5.commonImgs.img_lock" x="7" y="7" var="img_lock" scale="0.5"/>
			  <Image skin="png.uiPet.onEquip" x="35" y="-11" var="img_protect" visible="false"/>
			  <Box x="34" y="-18" var="img_using">
			    <Image skin="png.uiPet.onPos" y="8" width="43" height="50"/>
			    <Label text="\l32000016" autoSize="none" style="渐变红" width="62" height="20" align="center" size="14" rotation="53" x="11"/>
			  </Box>
			</View>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var redPoint:RedPointUI = null;
      
      public var img_lock:Image = null;
      
      public var img_protect:Image = null;
      
      public var img_using:Box = null;
      
      public function PetListRenderUI()
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
