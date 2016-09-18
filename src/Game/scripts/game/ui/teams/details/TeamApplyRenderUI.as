package game.ui.teams.details
{
   import morn.customs.components.PlayerRender;
   import morn.core.components.Label;
   import morn.core.components.Button;
   
   public class TeamApplyRenderUI extends PlayerRender
   {
      
      protected static var uiView:XML = <PlayerRender width="601" height="30">
			  <Label text="名字" x="16" y="8" var="txt_name" width="131" height="19" align="center" style="随品质变化"/>
			  <Label text="LV.56" x="165" y="8" var="txt_lv" width="36" height="18" style="普通说明"/>
			  <Label text="XXX" x="354" y="8" var="txt_fightValue" width="96" height="21" style="普通说明" align="center"/>
			  <Button label="通过" buttonMode="true" labelFont="FZZHB" x="530" y="2" var="btn_agree" style="按钮小绿"/>
			  <Button label="拒绝" buttonMode="true" labelFont="FZZHB" x="455" y="2" var="btn_refuse" style="按钮小红"/>
			  <Label text="公会名" x="219" y="8" var="txt_family" width="137" height="20" style="普通说明" align="center"/>
			</PlayerRender>;
       
      
      public var txt_name:Label = null;
      
      public var txt_lv:Label = null;
      
      public var txt_fightValue:Label = null;
      
      public var btn_agree:Button = null;
      
      public var btn_refuse:Button = null;
      
      public var txt_family:Label = null;
      
      public function TeamApplyRenderUI()
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
