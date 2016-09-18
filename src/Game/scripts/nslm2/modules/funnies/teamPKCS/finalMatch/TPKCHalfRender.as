package nslm2.modules.funnies.teamPKCS.finalMatch
{
   import game.ui.teamPKCS.finalMatch.TPKCHalfRenderUI;
   import proto.CTeamInfo;
   import nslm2.modules.funnies.teamPKCS.TPKConst;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.TextFieldUtil;
   
   public class TPKCHalfRender extends TPKCHalfRenderUI
   {
       
      
      public function TPKCHalfRender()
      {
         super();
         this.img_dot.visible = false;
         this.txt_index.visible = false;
         this.txt_info.text = "";
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(param1 == null)
         {
            return;
         }
         var _loc2_:CTeamInfo = param1 as CTeamInfo;
         this.txt_info.text = TPKConst.getDistName(_loc2_.op,_loc2_.dist,_loc2_.name) + "\n" + LocaleMgr.ins.getStr(50800048) + "：" + TextFieldUtil.htmlText2(TPKConst.getLeader(_loc2_.leader,_loc2_.member).info.name,16773888);
      }
   }
}
