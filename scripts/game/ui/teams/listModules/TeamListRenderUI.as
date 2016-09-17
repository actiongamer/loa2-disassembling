package game.ui.teams.listModules
{
   import morn.customs.components.PlayerRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.Button;
   
   public class TeamListRenderUI extends PlayerRender
   {
      
      protected static var uiView:XML = <PlayerRender width="222" height="84" visible="true">
			  <Image skin="png.a5.bgs.panelBgs.底框01" x="0" y="0" sizeGrid="16,16,16,16" width="222" height="84" var="img_bg"/>
			  <Image skin="png.a5.commonImgs.角色-黄色" x="54" y="9" width="148" height="24"/>
			  <Label text="名字" x="80" y="12" var="txt_name" width="82" height="18" align="left" style="随品质变化" autoSize="none"/>
			  <Label text="No.1999" x="150" y="11" var="txt_no" width="76" height="21" style="渐变1" autoSize="none" align="left" size="14"/>
			  <Label text="要求最低战力:111万" x="80" y="29" var="txt_fvMin" width="133" height="22" style="普通说明" align="left" autoSize="none"/>
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgNpcS1_4" var="img_quality" sizeGrid="6,6,6,6" width="64" height="64" x="10" y="10"/>
			  <Image skin="png.comp.image" x="14" y="14" var="img_icon" width="56" height="56"/>
			  <Label text="1/3" x="151" y="54" var="txt_memberCount" width="48" height="18" style="小标题" align="right" autoSize="none"/>
			  <Button label="申请" style="按钮小黄" var="btn_apply" x="82" y="50" visible="false"/>
			</PlayerRender>;
       
      
      public var img_bg:Image = null;
      
      public var txt_name:Label = null;
      
      public var txt_no:Label = null;
      
      public var txt_fvMin:Label = null;
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_memberCount:Label = null;
      
      public var btn_apply:Button = null;
      
      public function TeamListRenderUI()
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
