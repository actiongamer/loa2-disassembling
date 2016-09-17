package game.ui.battlefield.BattlefieldRank.render
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class BattlefieldTabRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="195" height="60" buttonMode="true" mouseChildren="false">
			  <Image skin="png.a5.comps.img_block" x="97" y="30" anchorX="0.5" anchorY="0.5" autoSize="false" width="195" height="60" var="img_bg"/>
			  <Image skin="png.uiBattlefields.battlefieldRankModule.img_selected" x="-2" y="-3" smoothing="true" width="197" height="66" mouseChildren="false" mouseEnabled="false" name="selectBoxAll"/>
			  <Image skin="png.a5.comps.img_block" x="97" y="30" anchorX="0.5" anchorY="0.5" autoSize="false" width="195" height="60" var="img_selectedBg" name="selectBox1"/>
			  <Image skin="png.a5.comps.img_block" x="30" y="30" anchorX="0.5" anchorY="0.5" var="img_icon"/>
			  <Label text="赛季排位" autoSize="none" x="10" y="19" style="渐变1" width="171" align="right" height="36" var="txt_rankName"/>
			</View>;
       
      
      public var img_bg:Image = null;
      
      public var img_selectedBg:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_rankName:Label = null;
      
      public function BattlefieldTabRenderUI()
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
