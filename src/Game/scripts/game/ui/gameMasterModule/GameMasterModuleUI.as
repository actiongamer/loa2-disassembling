package game.ui.gameMasterModule
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Image;
   import morn.core.components.Box;
   
   public class GameMasterModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="824" height="559">
			  <PanelBg x="8" y="6" width="804" height="551"/>
			  <Image skin="png.a5.comps.img_block" x="21" y="41" var="img_title" width="779" height="83"/>
			  <Image skin="png.a5.comps.img_block" x="-313" y="-137" var="img_person" width="714" height="712"/>
			  <Image skin="png.a5.comps.img_block" x="78" y="124" width="724" height="421" var="img_bg"/>
			  <Image skin="png.uiGameMaster.GM认证-bj001" x="110" y="429" visible="false"/>
			  <Image skin="png.uiGameMaster.GM认证-icon004" x="487" y="445" var="img_icon4" visible="false"/>
			  <Image skin="png.a5.comps.img_block" x="94" y="135" var="img_online" width="344" height="277"/>
			  <Image skin="png.a5.comps.img_block" x="435" y="135" var="img_gamehelp" width="344" height="277"/>
			  <Label text="\l13200901" autoSize="none" x="170" y="365" style="普通说明" width="199" height="20" align="center" mouseChildren="false" mouseEnabled="false"/>
			  <Label text="\l13200902" autoSize="none" x="482" y="365" style="普通说明" width="258" height="20" align="center" mouseChildren="false" mouseEnabled="false"/>
			  <Label text="\l13200907" autoSize="none" x="568" y="453" style="普通说明" width="127" height="71" multiline="true" wordWrap="true" leading="4.5" visible="false"/>
			  <Image skin="png.uiGameMaster.GM认证-在线服务&amp;游戏助手-高亮" x="94" y="135" var="img_light1" mouseChildren="false" mouseEnabled="false"/>
			  <Image skin="png.uiGameMaster.GM认证-在线服务&amp;游戏助手-高亮" x="435" y="135" var="img_light2" mouseChildren="false" mouseEnabled="false"/>
			  <Image skin="png.a5.comps.img_block" x="490" y="448" width="68" height="68" var="img_QRcode" visible="false"/>
			  <Box x="160" y="432" var="box1" buttonMode="true" mouseChildren="false" visible="false">
			    <Image skin="png.uiGameMaster.GM认证-icon001" var="img_icon1"/>
			    <Label text="\l13200903" autoSize="none" x="6" y="64" style="普通说明" width="54" height="21"/>
			    <Label text="\l13200904" autoSize="none" x="6" y="81" style="普通绿色" width="52" height="21"/>
			  </Box>
			  <Box x="241" y="432" var="box2" mouseChildren="false" buttonMode="true" visible="false">
			    <Image skin="png.uiGameMaster.GM认证-icon002" var="img_icon2"/>
			    <Label text="\l13200903" autoSize="none" x="6" y="64" style="普通说明" width="54" height="21"/>
			    <Label text="\l13200905" autoSize="none" x="6" y="81" style="普通绿色" width="52" height="21"/>
			  </Box>
			  <Box x="322" y="432" var="box3" buttonMode="true" mouseChildren="false" visible="false">
			    <Image skin="png.uiGameMaster.GM认证-icon003" var="img_icon3"/>
			    <Label text="\l13200903" autoSize="none" x="6" y="64" style="普通说明" width="54" height="21"/>
			    <Label text="\l13200906" autoSize="none" x="7" y="81" style="普通绿色" width="52" height="21"/>
			  </Box>
			</PopModuleView>;
       
      
      public var img_title:Image = null;
      
      public var img_person:Image = null;
      
      public var img_bg:Image = null;
      
      public var img_icon4:Image = null;
      
      public var img_online:Image = null;
      
      public var img_gamehelp:Image = null;
      
      public var img_light1:Image = null;
      
      public var img_light2:Image = null;
      
      public var img_QRcode:Image = null;
      
      public var box1:Box = null;
      
      public var img_icon1:Image = null;
      
      public var box2:Box = null;
      
      public var img_icon2:Image = null;
      
      public var box3:Box = null;
      
      public var img_icon3:Image = null;
      
      public function GameMasterModuleUI()
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
