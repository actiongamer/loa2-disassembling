package game.ui.roleInfos.tupos
{
   import morn.customs.components.PopModuleView;
   import game.ui.commons.comps.btns.BtnOkUI;
   import game.ui.commons.comps.btns.BtnCancelUI;
   import morn.core.components.List;
   import morn.core.components.Box;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class RoleTupoConfirmModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="382" height="250">
			  <PanelBgS3 x="0" y="-3" width="382" height="250" showLightBottom="true" frameStyle="1" frameVisible="true"/>
			  <BtnOk x="89" y="209" var="btnOk" runtime="game.ui.commons.comps.btns.BtnOkUI"/>
			  <BtnCancel x="215" y="209" var="btnCancel" runtime="game.ui.commons.comps.btns.BtnCancelUI"/>
			  <Label text="是否确认消耗以下英雄进行突破" x="17.5" y="37" width="347" height="18" style="重要提示绿" align="center"/>
			  <List x="31" y="52" repeatX="5" spaceX="12" repeatY="2" spaceY="15" vScrollBarSkin="png.a5.comps.scrollBar.vscroll_S3" width="320" var="list_feedheros">
			    <RoleTupoConfirmRender x="1" y="0" name="render" runtime="game.ui.roleInfos.tupos.RoleTupoConfirmRenderUI"/>
			  </List>
			  <Box var="box_alert" x="-93" y="-2" mouseChildren="false" mouseEnabled="false">
			    <Image skin="png.a5.commonImgs.img_alertBgS2" var="img_bg" sizeGrid="50,60,50,60" smoothing="true" y="108" width="268" scaleY="-1" x="0" height="174"/>
			    <Label text="已培养英雄无法作为突破消耗材料" autoSize="left" multiline="true" wordWrap="true" width="155" var="txt_content" leading="3" letterSpacing="1" style="普通说明" size="12" x="61"/>
			  </Box>
			</PopModuleView>;
       
      
      public var btnOk:BtnOkUI = null;
      
      public var btnCancel:BtnCancelUI = null;
      
      public var list_feedheros:List = null;
      
      public var box_alert:Box = null;
      
      public var img_bg:Image = null;
      
      public var txt_content:Label = null;
      
      public function RoleTupoConfirmModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.btns.BtnCancelUI"] = BtnCancelUI;
         viewClassMap["game.ui.commons.comps.btns.BtnOkUI"] = BtnOkUI;
         viewClassMap["game.ui.roleInfos.tupos.RoleTupoConfirmRenderUI"] = RoleTupoConfirmRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
