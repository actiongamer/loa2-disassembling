package game.ui.secretExplore
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Image;
   import morn.core.components.List;
   import morn.core.components.Button;
   import morn.core.components.Label;
   
   public class SEAssistRankUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="474" height="590">
			  <PanelBgS3 x="0" y="0" width="474" height="590" showLightBottom="true" frameStyle="1" frameVisible="true"/>
			  <Image skin="png.comp.image" x="9" y="35" width="453" height="497" var="img_bg"/>
			  <List x="28" y="62" var="list_item" repeatY="0" width="432" height="462">
			    <SEAssistRankRender name="render" runtime="game.ui.secretExplore.SEAssistRankRenderUI"/>
			  </List>
			  <Button label="按钮" x="175" style="按钮大绿" y="541.5" var="btn_reward"/>
			  <Label text="普通说明" autoSize="none" x="17" y="538" style="普通说明" var="txt_info"/>
			  <Label text="\l11800201" autoSize="none" x="30" y="40" style="升级后加底标题"/>
			  <Label text="\l50500039" autoSize="none" x="114" y="40" style="升级后加底标题"/>
			  <Label text="\l50700110" autoSize="none" x="210" y="40" style="升级后加底标题"/>
			  <Label text="\l11200003" autoSize="none" x="337" y="40" style="升级后加底标题"/>
			  <Label text="普通说明" autoSize="none" x="277" y="538" style="普通说明" var="txt_info1" width="178" height="20" align="right"/>
			</PopModuleView>;
       
      
      public var img_bg:Image = null;
      
      public var list_item:List = null;
      
      public var btn_reward:Button = null;
      
      public var txt_info:Label = null;
      
      public var txt_info1:Label = null;
      
      public function SEAssistRankUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.secretExplore.SEAssistRankRenderUI"] = SEAssistRankRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
