package config;

import org.hibernate.SessionFactory;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataBuilder;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.AvailableSettings;

import models.Admin;
import models.User;


public class HibernateConfig {

	private static final SessionFactory sessionFactory;
	static {
		try {
			// Create registry
			StandardServiceRegistry registry = new StandardServiceRegistryBuilder()
					.applySetting(AvailableSettings.DIALECT, "org.hibernate.dialect.MySQLDialect")
					.applySetting(AvailableSettings.DRIVER, "com.mysql.cj.jdbc.Driver")
					.applySetting(AvailableSettings.URL, "jdbc:mysql://localhost:3306/hibernate")
					.applySetting(AvailableSettings.USER, "root")
					.applySetting(AvailableSettings.PASS, "root")
					.applySetting(AvailableSettings.HBM2DDL_AUTO, "update") // or "update"
					.applySetting(AvailableSettings.SHOW_SQL, "true").build();

			// Create MetadataSources
			MetadataSources sources = new MetadataSources(registry);

			// Add annotated classes here
			 sources.addAnnotatedClass(Admin.class);
			 sources.addAnnotatedClass(User.class);

			// Create Metadata
			MetadataBuilder metadataBuilder = sources.getMetadataBuilder();
			Metadata metadata = metadataBuilder.build();

			// Create SessionFactory
			sessionFactory = metadata.getSessionFactoryBuilder().build();
		} catch (Throwable ex) {
			// Make sure you log the exception or handle it appropriately
			System.err.println("Initial SessionFactory creation failed." + ex);
			throw new ExceptionInInitializerError(ex);
		}
	}
	
	public static void shutdown() {
		getSessionFactory().close();
	}
	
	public static SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	public static void main(String[] args) {

		System.out.println(getSessionFactory());
		System.out.println("OK");
	}
}
