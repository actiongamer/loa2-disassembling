package game.ui.groupon.rank
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.Button;
   import morn.core.components.List;
   import morn.core.components.Image;
   import game.ui.commons.icons.WealthRenderS5UI;
   
   public class GrouponRewardListRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="651" height="58">
			  <Label text="1" autoSize="none" x="22" y="21" style="渐变1" width="104" height="22" align="center" var="txt_score"/>
			  <Button label="\l41300086" x="522" y="15" style="按钮大绿" var="btn_got"/>
			  <Label text="\l41300087" autoSize="none" x="531" y="24" style="普通灰色" width="104" height="22" align="center" var="txt_haveGot" mouseChildren="false" mouseEnabled="false"/>
			  <List x="278" y="5" repeatX="1" spaceX="6" var="rwdList">
			    <WealthRenderS5 name="render" runtime="game.ui.commons.icons.WealthRenderS5UI"/>
			  </List>
			  <Image skin="png.a5.commonImgs.img_gotReward" x="580" y="30" anchorX=".5" anchorY=".5" scale=".8" smoothing="true" var="img_got"/>
			</View>;
       
      
      public var txt_score:Label = null;
      
      public var btn_got:Button = null;
      
      public var txt_haveGot:Label = null;
      
      public var rwdList:List = null;
      
      public var img_got:Image = null;
      
      public function GrouponRewardListRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.WealthRenderS5UI"] = WealthRenderS5UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
