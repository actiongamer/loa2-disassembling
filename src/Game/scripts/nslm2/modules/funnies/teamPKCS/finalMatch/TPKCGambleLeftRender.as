package nslm2.modules.funnies.teamPKCS.finalMatch
{
   import game.ui.teamPKCS.finalMatch.TPKCGambleLeftRenderUI;
   import nslm2.modules.funnies.teamPKCS.preMatch.CTeamMemberVo;
   import nslm2.utils.PlayerVoUtils;
   import nslm2.common.vo.PlayerVo;
   import nslm2.utils.WealthUtil;
   import nslm2.utils.Uint64Util;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class TPKCGambleLeftRender extends TPKCGambleLeftRenderUI
   {
       
      
      public function TPKCGambleLeftRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(param1 == null)
         {
            return;
         }
         var _loc2_:CTeamMemberVo = param1 as CTeamMemberVo;
         var _loc3_:PlayerVo = PlayerVoUtils.playerBaseInfoToVo(_loc2_.info.info);
         this.img_icon.skin = _loc3_.headerIconUrl;
         WealthUtil.changeQualitySkin(this.img_quality,_loc3_.militaryQuality);
         if(Uint64Util.equal(_loc2_.leaderId,_loc3_.playerId))
         {
            this.img_leadercrown.visible = true;
         }
         else
         {
            this.img_leadercrown.visible = false;
         }
         this.txt_name.text = TextFieldUtil.htmlText2(_loc3_.name,ColorLib.qualityColor(_loc3_.militaryQuality));
         this.txt_fightValue.text = LocaleMgr.ins.getStr(50500030,[_loc3_.fightValue]);
         this.txt_order.text = LocaleMgr.ins.getStr(50800044,[_loc2_.order]);
      }
   }
}
