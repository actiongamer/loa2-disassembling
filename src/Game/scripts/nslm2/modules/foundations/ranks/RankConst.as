package nslm2.modules.foundations.ranks
{
   import com.mz.core.utils.DictHash;
   import nslm2.modules.foundations.ranks.comp.RankTitleInfo;
   import nslm2.utils.RTools;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class RankConst
   {
      
      public static const TITLE_LANG:int = 9111800;
      
      public static const WORD_ZHANLIBANG:int = 11800001;
      
      public static const WORD_DENGJIBANG:int = 11800002;
      
      public static const WORD_TIANTIBANG:int = 11800003;
      
      public static const WORD_GONGHUIBANG:int = 11800004;
      
      public static const WORD_ZHUXIANBANG:int = 11800005;
      
      public static const IMG_ZHANLI_WAIWEI:String = "png.uiRankModule.暗底.1";
      
      public static const IMG_DENGJI_WAIWEI:String = "png.uiRankModule.暗底.2";
      
      public static const IMG_TIANTI_WAIWEI:String = "png.uiRankModule.暗底.3";
      
      public static const IMG_GONGHUI_WAIWEI:String = "png.uiRankModule.暗底.4";
      
      public static const IMG_ZHUXIAN_WAIWEI:String = "png.uiRankModule.暗底.5";
      
      public static const IMG_ZHANLI_BG:String = "png.uiRankModule.亮底.1";
      
      public static const IMG_DENGJI_BG:String = "png.uiRankModule.亮底.2";
      
      public static const IMG_TIANTI_BG:String = "png.uiRankModule.亮底.3";
      
      public static const IMG_GONGHUI_BG:String = "png.uiRankModule.亮底.4";
      
      public static const IMG_ZHUXIAN_BG:String = "png.uiRankModule.亮底.5";
      
      public static const IMG_ZHANLI_TUBIAO:String = "png.uiRankModule.图标.图标1";
      
      public static const IMG_DENGJI_TUBIAO:String = "png.uiRankModule.图标.图标2";
      
      public static const IMG_TIANTI_TUBIAO:String = "png.uiRankModule.图标.图标3";
      
      public static const IMG_GONGHUI_TUBIAO:String = "png.uiRankModule.图标.图标4";
      
      public static const IMG_ZHUXIAN_TUBIAO:String = "png.uiRankModule.图标.图标5";
      
      public static const ZLBANG:int = 0;
      
      public static const DJBANG:int = 1;
      
      public static const TTBANG:int = 2;
      
      public static const GHBANG:int = 3;
      
      public static const ZXBANG:int = 4;
      
      public static const PAGEPRE:int = 1;
      
      public static const PAGENEX:int = 2;
      
      public static const PAGEFIR:int = 3;
      
      public static const PAGELAS:int = 4;
      
      private static var _ins:nslm2.modules.foundations.ranks.RankConst;
       
      
      public var rank:String;
      
      public var name:String;
      
      public var ability:String;
      
      public var lv:String;
      
      public var fam:String;
      
      public var famlv:String;
      
      public var famnum:String;
      
      public var famleader:String;
      
      public var starnum:String;
      
      private var rankLib:DictHash;
      
      private var rankBangDan:DictHash;
      
      public function RankConst()
      {
         rank = LocaleMgr.ins.getStr(11800201);
         name = LocaleMgr.ins.getStr(11800202);
         ability = LocaleMgr.ins.getStr(11800205);
         lv = LocaleMgr.ins.getStr(11800204);
         fam = LocaleMgr.ins.getStr(11800203);
         famlv = LocaleMgr.ins.getStr(11800506);
         famnum = LocaleMgr.ins.getStr(11800501);
         famleader = LocaleMgr.ins.getStr(11800502);
         starnum = LocaleMgr.ins.getStr(11800602);
         rankLib = new DictHash();
         rankBangDan = new DictHash();
         super();
         rankLib.put(0,new RankTitleInfo(rank,name,fam,lv,ability));
         rankLib.put(1,new RankTitleInfo(rank,name,fam,ability,lv));
         rankLib.put(2,new RankTitleInfo(rank,name,fam,ability,lv));
         rankLib.put(3,new RankTitleInfo(rank,fam,famleader,famlv,famnum));
         rankLib.put(4,new RankTitleInfo(rank,name,lv,fam,starnum));
         rankBangDan.put(0,new RankUtil(11800001,"png.uiRankModule.图标.图标1","png.uiRankModule.暗底.1","png.uiRankModule.亮底.1"));
         rankBangDan.put(1,new RankUtil(11800002,"png.uiRankModule.图标.图标2","png.uiRankModule.暗底.2","png.uiRankModule.亮底.2"));
         rankBangDan.put(2,new RankUtil(11800003,"png.uiRankModule.图标.图标3","png.uiRankModule.暗底.3","png.uiRankModule.亮底.3"));
         rankBangDan.put(3,new RankUtil(11800004,"png.uiRankModule.图标.图标4","png.uiRankModule.暗底.4","png.uiRankModule.亮底.4"));
         rankBangDan.put(4,new RankUtil(11800005,"png.uiRankModule.图标.图标5","png.uiRankModule.暗底.5","png.uiRankModule.亮底.5"));
      }
      
      public static function get ins() : nslm2.modules.foundations.ranks.RankConst
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.foundations.ranks.RankConst();
         }
         return _ins;
      }
      
      public function getRankConst(param1:int) : RankTitleInfo
      {
         return rankLib.getValueAt(param1);
      }
      
      public function getRankBangDan(param1:int) : RankUtil
      {
         return rankBangDan.getValue(param1);
      }
      
      public function dispose() : void
      {
         if(rankLib)
         {
            RTools.disposeDictHash(rankLib);
            rankLib = null;
         }
         if(rankBangDan)
         {
            rankBangDan.clear();
            rankBangDan = null;
         }
         _ins = null;
      }
   }
}
