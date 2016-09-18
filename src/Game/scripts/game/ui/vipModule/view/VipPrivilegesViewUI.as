package game.ui.vipModule.view
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Panel;
   import morn.core.components.List;
   import morn.core.components.Label;
   import morn.core.components.Button;
   import game.ui.vipModule.render.VipBgRenderUI;
   import game.ui.vipModule.render.VipPrivilegeRenderUI;
   import game.ui.vipModule.render.VipPrivilegesRenderUI;
   import game.ui.vipModule.render.VipTitleRenderUI;
   
   public class VipPrivilegesViewUI extends View
   {
      
      protected static var uiView:XML = <View width="773" height="382">
			  <Image skin="png.a5.bgs.panelBgs.raw.底板一级二级底九宫格" x="0" y="0" sizeGrid="44,32,44,32" width="773" height="382" var="img_bg"/>
			  <Image skin="png.a5.bgs.panelBgs.parts.img_title2S1" x="0" y="1" var="img_vip" width="772" height="29"/>
			  <Panel x="0" y="28" width="773" height="354" vScrollBarSkin="png.a5.comps.scrollBar.vscroll_S3" var="panel">
			    <List repeatY="10" var="bg_list">
			      <VipBgRender x="0" y="0" name="render" runtime="game.ui.vipModule.render.VipBgRenderUI"/>
			    </List>
			    <List var="vip_list" repeatX="16" y="0" x="183">
			      <VipPrivilegesRender x="-1" y="-7" name="render" runtime="game.ui.vipModule.render.VipPrivilegesRenderUI"/>
			    </List>
			    <List x="0" y="0" repeatY="10" var="title_list">
			      <VipPrivilegeRender name="render" width="100" runtime="game.ui.vipModule.render.VipPrivilegeRenderUI"/>
			    </List>
			  </Panel>
			  <Label text="VIP特权" autoSize="none" x="0" y="4" style="渐变1" width="183" align="center" var="txt_prompt" bold="false" size="14"/>
			  <List x="183" y="4" repeatX="16" var="list_viptitle">
			    <VipTitleRender name="render" runtime="game.ui.vipModule.render.VipTitleRenderUI"/>
			  </List>
			  <Button skin="png.a5.btns.btn_longBar" x="752" y="1" width="19" height="23" var="tween_btn"/>
			</View>;
       
      
      public var img_bg:Image = null;
      
      public var img_vip:Image = null;
      
      public var panel:Panel = null;
      
      public var bg_list:List = null;
      
      public var vip_list:List = null;
      
      public var title_list:List = null;
      
      public var txt_prompt:Label = null;
      
      public var list_viptitle:List = null;
      
      public var tween_btn:Button = null;
      
      public function VipPrivilegesViewUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.vipModule.render.VipBgRenderUI"] = VipBgRenderUI;
         viewClassMap["game.ui.vipModule.render.VipPrivilegeRenderUI"] = VipPrivilegeRenderUI;
         viewClassMap["game.ui.vipModule.render.VipPrivilegesRenderUI"] = VipPrivilegesRenderUI;
         viewClassMap["game.ui.vipModule.render.VipTitleRenderUI"] = VipTitleRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
