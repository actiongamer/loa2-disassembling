package game.ui.commons.props
{
   import morn.core.components.View;
   import morn.customs.components.ClipList;
   
   public class FightValueBoxUI extends View
   {
      
      protected static var uiView:XML = <View width="120" height="21">
			  <ClipList value="739" clipWidth="14" align="left" url="png.a5.comps.clipList.clipList_S15" x="55" y="0" gapX="-1" var="txt_fightValue"/>
			  <Image skin="png.a5.commonImgs.战力" x="0" y="0"/>
			</View>;
       
      
      public var txt_fightValue:ClipList = null;
      
      public function FightValueBoxUI()
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
