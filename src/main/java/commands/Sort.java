package commands;

import com.sun.jdi.Field;
import io.github.cdimascio.dotenv.Dotenv;
import net.dv8tion.jda.api.EmbedBuilder;
import net.dv8tion.jda.api.entities.MessageEmbed;
import org.postgresql.util.PSQLException;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.*;
import java.util.Arrays;
import java.util.Objects;

public class Sort {

    private String nom_sort;
    private int niveau_sort;
    private String ecole;
    private String duree_incantation;
    private String portee;
    private String composante;
    private String duree_sort;
    private String description;
    public String img_sort;

    public Sort(ResultSet res, Connection connexion) throws SQLException {

        this.nom_sort = res.getString("nom_sort");
        this.niveau_sort = res.getInt("niveau_sort");
        int id_ecole = res.getInt("ecole_sort");

        Statement statement = connexion.createStatement();
        ResultSet resultSet;
        try {
            String query = "SELECT nom_ecole FROM ecole WHERE id_ecole='" + id_ecole + "' LIMIT 1;";
            resultSet = statement.executeQuery(query);
        }
        catch (PSQLException e){
            throw new RuntimeException(e);
        }

        if(resultSet.next()){
            this.ecole = resultSet.getString("nom_ecole");
        }
        else{
            this.ecole = "Aucune";
        }

        this.ecole = resultSet.getString("nom_ecole");
        this.duree_incantation = res.getString("duree_incantation");
        this.portee = res.getString("portee");
        this.composante = res.getString("composantes");
        this.duree_sort = res.getString("duree_sort");
        this.description = res.getString("description");
        this.img_sort = res.getString("img_sort");
    }

    public EmbedBuilder createEmbed(){

        EmbedBuilder embed = new EmbedBuilder();
        embed.setThumbnail(this.img_sort);
        //Nom du sort
        embed.setTitle(this.nom_sort);
        //Ecole du sort
        if(this.ecole!=null)
            embed.addField("Ecole",this.ecole+"", true);
        //Niveau du sort
        if(this.niveau_sort==0){
            embed.addField("Niveau","Sort mineur", true);
        }
        else if(this.niveau_sort==-1){
            embed.addField("Niveau","Sort de classe", true);
        }
        else if(this.niveau_sort==-2){
            embed.addField("Niveau","Sort de race", true);
        }
        else{
            embed.addField("Niveau",this.niveau_sort+"", true);
        }
        //Durée d'incantation
        if(this.duree_incantation!=null)
            embed.addField("Durée d'incantation", this.duree_incantation, true);
        //Portée
        if(this.portee!=null)
            embed.addField("Portée", this.portee, true);
        //Composantes
        if(this.composante!=null)
            embed.addField("Composantes", this.composante, true);
        //Durée du sort
        if(this.duree_sort!=null)
            embed.addField("Durée du sort", this.duree_sort, true);
        //Description du sort
        if (this.description.length() <= 1024) {
            // Ajouter la description comme un seul champ s'il n'y a pas de dépassement
            embed.addField("Description", this.description, false);
        } else {
            // Diviser la description en morceaux plus petits sans couper une phrase
            int descriptionLength = this.description.length();
            int chunkSize = 1024;
            int i_desc = 1;

            for (int i = 0; i < descriptionLength; i += chunkSize) {
                int endIndex = Math.min(i + chunkSize, descriptionLength);

                // Revenir en arrière pour trouver le dernier point ajouté
                int carSupp=0;
                while (endIndex < descriptionLength && this.description.charAt(endIndex - 1) != '.') {
                    carSupp++;
                    endIndex--;
                }

                String chunk = this.description.substring(i, endIndex);

                embed.addField("Description (partie " + i_desc + ")", chunk, false);
                i_desc++;

                i-=carSupp;
            }
        }

        return embed;
    }
}
