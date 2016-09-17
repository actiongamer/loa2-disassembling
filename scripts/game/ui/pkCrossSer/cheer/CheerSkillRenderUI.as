package game.ui.pkCrossSer.cheer
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.Button;
   
   public class CheerSkillRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="376" height="78">
			  <Image skin="png.uiPKCrossSer.img_cheer_bg" x="0" y="0"/>
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgSkillS1" x="35" y="15" sizeGrid="22,22,22,22" width="50" height="50"/>
			  <Image skin="png.comp.image" x="38" y="18" var="img_icon" width="44" height="44"/>
			  <Label text="普通说明" autoSize="none" x="97" y="16" style="普通说明" width="159" height="20" var="txt_name"/>
			  <Label text="普通说明" autoSize="none" x="97" y="44" style="普通说明" width="166" height="20" var="txt_desc"/>
			  <Button label="助威" x="267" y="40" style="按钮中绿" var="btn_cheer"/>
			  <Label text="普通说明" autoSize="none" x="198" y="9" style="普通说明" width="189" height="20" var="txt_jihuo" align="center"/>
			</View>;
       
      
      public var img_icon:Image = null;
      
      public var txt_name:Label = null;
      
      public var txt_desc:Label = null;
      
      public var btn_cheer:Button = null;
      
      public var txt_jihuo:Label = null;
      
      public function CheerSkillRenderUI()
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
