package game.ui.commons.comps.others
{
   import morn.core.components.View;
   import morn.core.components.Label;
   
   public class QQBuyTimesRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="382" height="250">
			  <Label text="重置次数重置次数重置次数重置次数重置次数重置次数重置次数重置次数重置2次数重置" autoSize="none" y="53" var="txt_alert" align="center" size="14" multiline="true" wordWrap="true" x="28" centerX="0" style="普通说明" leading="6" width="317" height="138"/>
			  <Label text="腾讯用户首次8折" autoSize="none" x="78.5" y="132" style="渐变绿" width="185" height="23" align="center" font="Microsoft YaHei" var="txt_qqAlert"/>
			</View>;
       
      
      public var txt_alert:Label = null;
      
      public var txt_qqAlert:Label = null;
      
      public function QQBuyTimesRenderUI()
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
