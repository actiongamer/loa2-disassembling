package nslm2.modules.cultivates.roleTeam.view
{
   import game.ui.roleTeam.HeroYuanfenInfoBoxUI;
   import proto.PanelBaseInfo;
   import nslm2.modules.roleInfos.HeroInfoUtil;
   import nslm2.modules.roleInfos.equipPanels.MengYuePropVo;
   import nslm2.utils.YuanFenUtil;
   
   public class HeroYuanfenInfoBox extends HeroYuanfenInfoBoxUI
   {
       
      
      private var _data:PanelBaseInfo;
      
      public function HeroYuanfenInfoBox()
      {
         super();
      }
      
      public function setHeroInfo(param1:PanelBaseInfo) : void
      {
         _data = param1;
         txt_heroName.text = HeroInfoUtil.getNameHasTupoLevel(_data.baseId);
         var _loc2_:Array = MengYuePropVo.idArrToVoArr(HeroInfoUtil.getNodeId(_data.baseId),_data.mengyue,_data,1);
         _loc2_.sort(YuanFenUtil.sortYuanfen);
         list_yuanfen.repeatY = _loc2_.length;
         list_yuanfen.dataSource = _loc2_;
      }
      
      override public function get height() : Number
      {
         return list_yuanfen.height + list_yuanfen.y;
      }
   }
}
