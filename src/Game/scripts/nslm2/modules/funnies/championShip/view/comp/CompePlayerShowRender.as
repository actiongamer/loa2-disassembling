package nslm2.modules.funnies.championShip.view.comp
{
   import game.ui.championship.comp.CompePlayerShowViewUI;
   import proto.CompetePlayerDisplayInfo;
   import nslm2.modules.scenes.commons.Unit3DBase;
   import nslm2.modules.footstones.linkModules.LinkUtils;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.funnies.championShip.consts.ChampionshipConsts;
   import nslm2.modules.funnies.championShip.model.ChampionShipModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class CompePlayerShowRender extends CompePlayerShowViewUI
   {
      
      private static const GROUP_NAME:Array = ["A","B","C","D"];
       
      
      private var _data:CompetePlayerDisplayInfo;
      
      private var avatar:Unit3DBase;
      
      public function CompePlayerShowRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         _data = param1 as CompetePlayerDisplayInfo;
         nameRender.img_bgSelf.visible = false;
         box_empty.visible = true;
         nameRender.txt_name.text = "";
         nameRender.visible = false;
         if(_data)
         {
            nameRender.visible = true;
            nameRender.txt_name.text = LinkUtils.playerNameSmart(_data.baseInfo.id,_data.baseInfo.name,_data.baseInfo.dist,ColorLib.getMilitaryColor(_data.baseInfo.militaryRank));
            if(PlayerModel.ins.isCurPlayer(_data.baseInfo.id))
            {
               nameRender.img_bgSelf.visible = true;
            }
            box_empty.visible = false;
            if(!avatar)
            {
               avatar = new Unit3DBase();
               avatar.scaleAll = 0.8;
               avatar.pos2d = ChampionshipConsts.AVATAR_POS[_data.displayIndex - 3];
            }
            PlayerModel.ins.changePlayerViewByPlayerBaseInfo(avatar,_data.baseInfo);
            ChampionShipModel.ins.layer3D.addChild(avatar);
         }
         else
         {
            if(avatar)
            {
               avatar.dispose();
               avatar = null;
            }
            txt_title.text = LocaleMgr.ins.getStr(999000407,[GROUP_NAME[param1]]);
         }
         .super.dataSource = param1;
      }
   }
}
