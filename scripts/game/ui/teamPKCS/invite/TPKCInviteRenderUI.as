package game.ui.teamPKCS.invite
{
   import morn.customs.components.PlayerRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.Button;
   
   public class TPKCInviteRenderUI extends PlayerRender
   {
      
      protected static var uiView:XML = <PlayerRender width="376" height="95">
			  <Image skin="png.comp.image" x="0" y="0" var="img_bg_frame" width="376" height="95"/>
			  <Image skin="png.comp.image" x="4" y="4" var="img_bg_people" width="95" height="83"/>
			  <Label text="\l50500040" autoSize="none" x="120" y="12" style="普通说明" width="91" height="19" var="txt_level"/>
			  <Label text="\l50500041" autoSize="none" x="217" y="12" style="普通说明" var="txt_fightValue" width="134" height="20"/>
			  <Button label="\l999900294" x="149" y="60" style="按钮小绿3" var="btn_agree"/>
			  <Button x="248" y="60" stateNum="1" label="\l999900295" style="按钮小黄" var="btn_refuse"/>
			  <Label text="\l50800003" autoSize="none" x="119" y="33" style="普通说明" var="txt_explain"/>
			</PlayerRender>;
       
      
      public var img_bg_frame:Image = null;
      
      public var img_bg_people:Image = null;
      
      public var txt_level:Label = null;
      
      public var txt_fightValue:Label = null;
      
      public var btn_agree:Button = null;
      
      public var btn_refuse:Button = null;
      
      public var txt_explain:Label = null;
      
      public function TPKCInviteRenderUI()
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
