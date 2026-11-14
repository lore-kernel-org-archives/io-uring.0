Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794653191;
	b=RstQlCAnFqxi0CxKnqZyQNuQvviZ9BGfmkjbnSIMR4B5AOf3hHXlwvaO7+TuEbN3Qk0l
	 1y2m80+Bo+Bz77a95hY1HrLLSPntvkTe8SC159M82rKL36qisiD1dXoV4AhAgzwoTcL9V
	 Do3gHBOHFcP1O2efRr3MzklUhU1nfWaKtl4+vy08RHUYas0wlDDvlHXA3nRiLQOBYgNwQ
	 0d2pmqjjWPXowIUN0hYpmQlGbx5vFCwu9txms/prajs1WliynFqHAlDof4VQm7jFRNkz+
	 Z34T/abtH6wTsTBEpF61E4g6sCXoCX5y9IVRWFTf73TjapecygdH5UnybRvXgVzaI6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794653191;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=C6u5x5/DdMosjCSe/xuxd40YZvBeML2e32CnbMo6vE0=;
	b=FAKXdHbEnFQV0GlwWc7R0vlPYTNrrStDB6nnLilzMJmRmFpqb7K6G1s8gEjJsdSMyncn
	 J2I75c8PxxCDv3300Jh5b8mqlAnuHx35sETxi2L7WHXtXszPvYoXqUwJBYgHzuGUInjh6
	 tr3eFBLd8WlFtz/UuolwRZq3E6S4lIrehB66QKyRit4u9xhhtUXBY5ptOtAthTwmgg1pm
	 FsvQ0ICuknam3hDweKylVW6m16uIM5twgYHOnHJvIz+1mWGOxiyMRe9bxzUGMAoBrFZ9/
	 zVTpBjFq+SPfL4De/x37kCEQtW5+vmkH5cosoDm4utCquS+j0RtuN3sd+CeDNNmjJbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hdUGXGPM;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247C4606A329
	for <io-uring@vger.kernel.org>; Sat, 14 Nov 2026 10:46:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 247C4606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hdUGXGPM
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-49134c8509fso1973816f8f.1
        for <io-uring@vger.kernel.org>; Sat, 14 Nov 2026 02:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794653189; x=1795257989; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C6u5x5/DdMosjCSe/xuxd40YZvBeML2e32CnbMo6vE0=;
        b=hdUGXGPMuzJATrP8CQSkwqN9F4guGypyou8IOW3tXduPT6zToglo1XbRnVGIWpH4BI
         7R3NcVrpUfo6gIU2cmt//UJMcdkBevGkd4AO3ni0x5nnnSinKZVGjcwH+1pgT/+Kx2ix
         2/xTYWjNJhilpyKHr23/dKzWSEXcNPFK3iaYZTPLeneJTNF85c0Wgo6dF3ZfyNjyjns0
         GeypPXZ0CHP4s1SP65d4U3Dh1asTNjj4/7XY1et7zN2CA4GAStlJzz3JX31eszb9paLz
         YGA6V0N5x0bBA6eJ2iq0NgcE8OUKTb5qX9WbskI0tqbPnSvE+i1gDpUHqTyY0TkIllVF
         +YXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794653189; x=1795257989;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C6u5x5/DdMosjCSe/xuxd40YZvBeML2e32CnbMo6vE0=;
        b=jHMv/PHWxWz25LUUAcRY0oS2eSVhcDl/WEC9Fu3nX6ydhE8oQFpjkXDT1Kc4T4NFvU
         d1G+2nIiCp6qN/ntzES5FA2i6X98W+Nv7VWP6IOqCpWBzmz3iHLv63m7A6tKhKudEAVP
         VrNftqbDQWutZR6cbCoSU7EDpXxn3fE0yJeiD18pGoeSUEsHch2052Twg+GB2s57a516
         CPO5rySEMJ2h3CTY1cbuFgsZEIzTSs/Vz9FW3XIWgeqanj+iW6eLbho/fkmNOqvMnvOm
         ChhoxPv3bzE2gHz7ssMuiRYQ6+bh7MPQB2ZI37XJg+YOvDKaP3xBvFmIR05q3yTjq8Bg
         Zvsw==
X-Gm-Message-State: APuU4Z9wmiXxBiRKlbYltk0dFguFfagJZ0ym9OHhqUZmBmlTONOWBSc9
	+BU18RvVVhiUP6R0mvxQPeoCsvqK/NCCGDS4L2KvphrOCkd42hjn4sCN
X-Gm-Gg: AYBFou2vzwW6HVX864UgXu7v78UhWnhRL0GMGc59dlZAMW/1rYO7ZPRf2mW9krzwgJg
	mLnJpYQEbirsnkZoV99Fya5j2eY78Q2/xP9LELSsuNJ3uwC28YiR+sBsPH18ZxIp3WEV7kDNnP4
	5AMVbj4LHT6DdJv4cJEBCFk/98oZvD3CJv7C/KFV4BHn5pWdW/H4PfW5trtJxFTcOm08OkSjC+k
	q76sqmWqV5FViGQT8orpKR7xOpF2iX8jUMZqsRada59NrB+52Z/ezrj/u0n3AUMyHvh1UPZlYfj
	sqRfkUY6+McFs3esFBqt0YmKIkNS1Xqa/EoRM9P+CQFKc1bJ14tJ0Jo0J0gN+8yt+hPxTOuN2PN
	/MBezGRRReN3SdU4FeJoTBYonnLmjB/d+eVMVfkXRFcZH1juNY154pfi3gyvT4X0XLJS/OogC9I
	NlTkKbglCuEAygXt6ZDxtTGsX72L38cNzDxg62oRa4bfCAti+QyujgTB0/+LjTZcrtk1ucLCMt7
	AIAtpNtA8G9i32rQCH9tRaqQok+LAzeCVSMy1uuRS7As3VvIfqH/xpCcYXyAp+eLm8dGMUNdZCD
	qXGL0GW0JfKgIXheQVTuHOysG4zDOQq1k3th+iaIzk0HM2lm3u8oJqj5fYZNmnuphBcvTp79+q8
	RC+KMDTOZ9XoR77PeoK3uRfQS
X-Received: by 2002:a05:600c:e555:10b0:4a3:59c9:a747 with SMTP id 5b1f17b1804b1-4bb55a4e55emr76257775e9.17.1794653189422;
        Sat, 14 Nov 2026 02:46:29 -0800 (PST)
Received: from meven-thinkpad.home (2a01cb088745e00090de407b41070a01.ipv6.abo.wanadoo.fr. [2a01:cb08:8745:e000:90de:407b:4107:a01])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb609cc1b2sm45447055e9.11.2026.11.14.02.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 02:46:29 -0800 (PST)
From: =?UTF-8?q?M=C3=A9ven=20Car?= <meven29@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	=?UTF-8?q?M=C3=A9ven=20Car?= <meven@kde.org>
Subject: [RFC PATCH v3 1/2] fs: add filename_utimensat()
Date: Sat, 14 Nov 2026 11:46:20 +0100
Message-ID: <20261114104621.1186744-2-meven29@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114104621.1186744-1-meven29@gmail.com>
References: <20261114104621.1186744-1-meven29@gmail.com>
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Méven Car <meven@kde.org>

Copy utilities that preserve timestamps, like cp -p or a file manager,
set the times of every copy after its last write. To do that through
io_uring, the request needs the utimensat() lookup on a name that was
imported at submission time.

io_uring takes the path of a request when it is submitted and looks it
up later, from a worker thread. The path ops it already has call the
filename_*() helpers of fs/namei.c with a struct filename. utimensat(2)
had no such helper: do_utimes_path() took the user pointer and imported
the name itself.

Split the lookup and the vfs_utimes() call out of do_utimes_path() into
filename_utimensat(), declared in fs/internal.h next to the other
filename_*() helpers. do_utimes_path() now only imports the name.

Signed-off-by: Méven Car <meven@kde.org>
Reviewed-by: Jan Kara <jack@suse.cz>
---
 fs/internal.h |  2 ++
 fs/utimes.c   | 12 +++++++++---
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/fs/internal.h b/fs/internal.h
index c658c8a5ebd5..985b2bc5895e 100644
--- a/fs/internal.h
+++ b/fs/internal.h
@@ -63,6 +63,8 @@ int filename_mknodat(int dfd, struct filename *name, umode_t mode, unsigned int
 int filename_symlinkat(struct filename *from, int newdfd, struct filename *to);
 int filename_linkat(int olddfd, struct filename *old, int newdfd,
 			struct filename *new, int flags);
+int filename_utimensat(int dfd, struct filename *name,
+		       struct timespec64 *times, int flags);
 int vfs_tmpfile(struct mnt_idmap *idmap,
 		const struct path *parentpath,
 		struct file *file, umode_t mode);
diff --git a/fs/utimes.c b/fs/utimes.c
index e22664e4115f..8072f05ac8dc 100644
--- a/fs/utimes.c
+++ b/fs/utimes.c
@@ -79,8 +79,8 @@ int vfs_utimes(const struct path *path, struct timespec64 *times)
 }
 EXPORT_SYMBOL_GPL(vfs_utimes);
 
-static int do_utimes_path(int dfd, const char __user *filename,
-		struct timespec64 *times, int flags)
+int filename_utimensat(int dfd, struct filename *name,
+		       struct timespec64 *times, int flags)
 {
 	struct path path;
 	int lookup_flags = 0, error;
@@ -91,7 +91,6 @@ static int do_utimes_path(int dfd, const char __user *filename,
 	if (!(flags & AT_SYMLINK_NOFOLLOW))
 		lookup_flags |= LOOKUP_FOLLOW;
 
-	CLASS(filename_uflags, name)(filename, flags);
 retry:
 	error = filename_lookup(dfd, name, lookup_flags, &path, NULL);
 	if (error)
@@ -105,6 +104,13 @@ static int do_utimes_path(int dfd, const char __user *filename,
 	return error;
 }
 
+static int do_utimes_path(int dfd, const char __user *filename,
+		struct timespec64 *times, int flags)
+{
+	CLASS(filename_uflags, name)(filename, flags);
+	return filename_utimensat(dfd, name, times, flags);
+}
+
 static int do_utimes_fd(int fd, struct timespec64 *times, int flags)
 {
 	if (flags)
-- 
2.56.1

