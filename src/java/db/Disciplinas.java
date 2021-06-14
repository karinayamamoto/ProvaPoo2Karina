/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

/**
 *
 * @author cutekah
 */
public class Disciplinas {
    Private String nome;
    Private String diaDaSemana;
    Private String horario;
    Private int qtAulas;
    Private Double notap1;
    Private Double notap2;
    
    public static ArrayList<Dsciplinas> getDisciplinas() throws Exception{
        Connection con = DbListener.getConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("select * from disciplinas order by nome");
        while(rs.next()){
            list.add(new Disciplinas (
            rs.getString("nome"),
            rs.getString("diadasemana"),
            rs.getString("horario"),
            rs.getString("qtaulas"),
            rs.getString("notap1"),
            rs.getString("notap2"),
        
        ));
                    
        }
        rs.close();
        stmt.close();
        con.close();
        return list;
    }
    
    public static void addDisciplina(, String nome, String diaDaSemana, String horario, int qrAulas, Double notap1, Double notap2) throws Exception{
        Connection con = DbListener.getConnection();
        String sql = "insert to disciplinas (nome, diadasemana, horario,  qtaulas, notap1, notap2)"
                +"VALUES (?, ?, ?, ?, ?, ?)";
        Statement stmt = con.prepareStatement();
        stmt.setString(1, nome);
        stmt.setString(2, diaDaSemana);
        stmt.setString(3, horario);
        stmt.setInt(4, qtAulas);
        stmt.setDouble(5, notap1);
        stmt.setDouble(6, notap2);
        stmt.execute();
        stmt.close();
        con.close();
    }
    
    public static void updateDisciplina(, String nome, String diaDaSemana, String horario, int qrAulas, Double notap1, Double notap2) throws Exception{
        Connection con = DbListener.getConnection();
        String sql = "update disciplinas from disciplinas where nome = ?";
        Statement stmt = con.prepareStatement();
        stmt.setString(1, nome);
        stmt.setString(2, diaDaSemana);
        stmt.setString(3, horario);
        stmt.execute();
        stmt.close();
        con.close();
    
}
     Public Disciplinas (String nome, String diaDaSemana, String horario, int qrAulas, Double notap1, Double notap2) {
         this.nome = nome;
         this.diaDaSemana = diaDaSemana;
         this.horario = horario;
         this.qtAulas = qtAulas;
         this.nome = notap1;
         this.nome = notap2;
}
     
public String getNome() {
    return nome;
}
public void setNome(String nome) {
    this.nome = nome;
}
public String getDiaDaSemana() {
    return diaDaSemana;
}
public void setDiaDaSemana(String DiaDaSemana) {
    this.DiaDaSemana = diaDaSemana;
}
public String getHorario() {
    return horario;
}
public void setHorario(String horario) {
    this.horario = horario;
}
public String getQtAulas() {
    return qtAulas;
}
public void setQtAulas(int qtAulas) {
    this.qtAulas = qtAulas;
}
public String getNotap1() {
    return notap1;
}
public void setNotap1(String notap1) {
    this.notap1 = notap1;
}
public String getNotap2() {
    return notap2;
}
public void setNotap2(String notap2) {
    this.notap2 = notap2;
}

}
         