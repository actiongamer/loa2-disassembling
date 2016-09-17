package nslm2.modules.footstones.tipMenus.handlers
{
   import com.mz.core.mgrs.UIMgr;
   import flash.system.System;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import proto.GameFriendData;
   import nslm2.common.vo.PlayerVo;
   
   public class CopyPlayerNameTipMenuHandler extends TipMenuHandlerBase
   {
       
      
      public function CopyPlayerNameTipMenuHandler()
      {
         super();
      }
      
      override public function exec() : void
      {
         super.exec();
         UIMgr.stage.mouseX;
         System.setClipboard(playerName);
         AlertUtil.float(LocaleMgr.ins.getStr(999000145),UIMgr.ins.stageMouseXY);
      }
      
      public function get playerName() : String
      {
         if(this.data is GameFriendData)
         {
            return (this.data as GameFriendData).name;
         }
         if(this.data is PlayerVo)
         {
            return (this.data as PlayerVo).name;
         }
         return String(this.data);
      }
   }
}
