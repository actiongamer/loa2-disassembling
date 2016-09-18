package game.ui.settingModule.view
{
   import morn.core.components.View;
   import morn.core.components.CheckBox;
   import morn.core.components.Label;
   import morn.core.components.List;
   
   public class FunctionSettingViewUI extends View
   {
      
      protected static var uiView:XML = <View width="600" height="400" name="render">
			  <CheckBox label="一键拒绝" x="44" y="39" style="Radio普通" selected="true" var="refuseAll"/>
			  <Label text="快捷设置" autoSize="none" x="15" y="5" style="加底标题" var="simpleSetting"/>
			  <Label text="详细设置" autoSize="none" x="15" y="114" style="加底标题" var="detailSetting"/>
			  <List x="40" y="158" repeatX="3" repeatY="3" spaceX="100" spaceY="30" var="list_function" vScrollBarSkin="png.a5.comps.scrollBar.vscroll_S3" width="521" height="129">
			    <FuncSettingListRender x="7" y="-4" name="render" runtime="game.ui.settingModule.view.FuncSettingListRenderUI"/>
			  </List>
			  <Image skin="png.a5.commonImgs.线" x="-8" y="92" width="665"/>
			</View>;
       
      
      public var refuseAll:CheckBox = null;
      
      public var simpleSetting:Label = null;
      
      public var detailSetting:Label = null;
      
      public var list_function:List = null;
      
      public function FunctionSettingViewUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.settingModule.view.FuncSettingListRenderUI"] = FuncSettingListRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
