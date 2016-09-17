package game.ui.commons.props
{
   import morn.core.components.View;
   import morn.customs.components.ClipList;
   
   public class FightValueBoxS4UI extends View
   {
      
      protected static var uiView:XML = <View width="120" height="21">
			  <ClipList value="739" clipWidth="14" align="right" url="png.a5.comps.clipList.clipList_S15" x="67" y="0" gapX="-1" var="txt_fightValue" height="20"/>
			  <Image skin="png.a5.commonImgs.战力" x="76" y="0"/>
			</View>;
       
      
      public var txt_fightValue:ClipList = null;
      
      public function FightValueBoxS4UI()
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
